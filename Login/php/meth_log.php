<?php
session_start();

require_once('db_Connect.php');
$db = new ConectarBD();
$conn = $db->getConnection();

// Obtener datos del formulario
$formUsername = $_POST['username'];
$formPassword = $_POST['password'];
$recaptchaResponse = $_POST['g-recaptcha-response'];

// Verificar reCAPTCHA
$secretKey = '6LdFnykqAAAAAEIDDARsitw3AzhkQoCNar9qd74f';
$recaptchaUrl = 'https://www.google.com/recaptcha/api/siteverify';
$response = file_get_contents($recaptchaUrl . '?secret=' . $secretKey . '&response=' . $recaptchaResponse);
$responseKeys = json_decode($response, true);

if ($responseKeys['success']) {
    // Inicializar intentos fallidos si no están configurados
    if (!isset($_SESSION['attempts'])) {
        $_SESSION['attempts'] = 0;
    }

    // Buscar usuario en la base de datos
    $sql = "SELECT U.cod_usu, U.usuarme AS username, U.password, U.Estado, R.tipo_rol, C.name
            FROM tb_usuario U
            LEFT JOIN tb_rol R ON U.idrol = R.idrol
            LEFT JOIN tb_credenciales C ON C.usuarme = U.usuarme
            WHERE U.usuarme = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $formUsername);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // Verificar el estado del usuario
        if ($user['Estado'] === 'bloqueado') {
            header("Location: login.php?error=2");
            exit();
        }

        // Verificar la contraseña cifrada
        if (password_verify($formPassword, $user['password'])) {
            $_SESSION['attempts'] = 0;
            $_SESSION['username'] = $user['username'];
            $_SESSION['cod_usu'] = $user['cod_usu'];

            // Registrar intento exitoso en auditoría
            $auditSql = "INSERT INTO tb_auditoria (cod_usu, fecha_evento, inicio_sesion) 
                         VALUES (?, NOW(), 'exitoso')";
            $auditStmt = $conn->prepare($auditSql);
            $auditStmt->bind_param("i", $user['cod_usu']);
            $auditStmt->execute();
            $auditStmt->close();

            // Redirigir con parámetros de éxito y página de destino
            if ($user['tipo_rol'] == 'Administrador') {
                $_SESSION['role'] = 'Administrador';
                $_SESSION['nombreCompleto'] = $user['name'];
                header("Location: login.php?login_success=1&redirect=admin.php");
            } else if ($user['tipo_rol'] == 'Docente') {
                $_SESSION['role'] = 'Docente';
                $_SESSION['nombreCompleto'] = $user['name'];
                header("Location: login.php?login_success=1&redirect=Docente.php");
            } else if ($user['tipo_rol'] == 'Estudiante') {
                $_SESSION['role'] = 'Estudiante';
                $_SESSION['nombreCompleto'] = $user['name'];
                header("Location: login.php?login_success=1&redirect=Estudiante.php");
            }
        } else {
            $_SESSION['attempts'] += 1;
            
            $auditSql = "INSERT INTO tb_auditoria (cod_usu, fecha_evento, inicio_sesion) 
                         VALUES (?, NOW(), 'fallido')";
            $auditStmt = $conn->prepare($auditSql);
            $auditStmt->bind_param("i", $user['cod_usu']);
            $auditStmt->execute();
            $auditStmt->close();

            if ($_SESSION['attempts'] >= 3) {
                $updateSql = "UPDATE tb_usuario SET Estado = 'bloqueado' WHERE cod_usu = ?";
                $updateStmt = $conn->prepare($updateSql);
                $updateStmt->bind_param("i", $user['cod_usu']);
                $updateStmt->execute();
                $updateStmt->close();

                header("Location: login.php?error=2");
                exit();
            } else {
                header("Location: login.php?error=1");
                exit();
            }
        }
    } else {
        header("Location: login.php?error=1");
        exit();
    }

    $stmt->close();
    $conn->close();
} else {
    header("Location: login.php?error=recaptcha");
    exit();
}
?>
