<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/message.css"> 
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <?php
        session_start();

        if (isset($_GET['logout']) && $_GET['logout'] == 1) {
            echo '<div class="message-container">
                    <div id="logout-message" class="message success">
                        Sesión terminada
                    </div>
                </div>';
        }

        if (isset($_GET['error']) && $_GET['error'] == 2) {
            echo '<div class="message-container">
                    <div id="error-message-blocked" class="message blocked">
                        Usuario bloqueado. Por favor, inténtelo más tarde.
                    </div>
                </div>';
        }


        if (isset($_SESSION['attempts']) && $_SESSION['attempts'] > 0 && $_SESSION['attempts'] < 3) {
            $attemptsLeft = 3 - $_SESSION['attempts'];
                echo '<div class="message-container">
                        <div id="attempts-message" class="message intentos">
                            Intentos restantes: ' . $attemptsLeft . '
                        </div>
                      </div>';
        }

        if (isset($_GET['error']) && $_GET['error'] == 'recaptcha') {
            echo '<div class="message-container">
                    <div id="error-message-recaptcha" class="message recaptcha">
                        Error en la verificación del reCAPTCHA. Por favor, inténtelo de nuevo.
                    </div>
                </div>';
        }
    ?>
    <div class="login-box">
        <h2>Iniciar Sesión</h2>
        <form action="meth_log.php" method="post" id="loginForm">
            <div class="user-box">
                <input type="text" name="username" required="">
                <label>Usuario</label>
            </div>
            <div class="user-box">
                <input type="password" name="password" required="">
                <label>Contraseña</label>
            </div>
            <?php
                if (isset($_GET['error']) && $_GET['error'] == 1) {
                    echo '<div id="error-message-incorrect" class="msg error">
                                Usuario y/o clave incorrectos.
                          </div>';
                }
            ?>
            <div class="g-recaptcha" data-sitekey="6LdFnykqAAAAABZAm4_ELrHmq_MLHt0nMS-Q2L-c"></div>
            <a href="#" onclick="document.getElementById('loginForm').submit();">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Iniciar sesión 
            </a>
            
        </form>
    </div>

    <script src="../js/msg.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has('login_success')) {
                Swal.fire({
                    icon: 'success',
                    title: 'Inicio exitoso',
                    text: 'Has iniciado sesión correctamente.',
                    showConfirmButton: false,
                    timer: 1000 // 2 segundos de retraso antes de redirigir
                }).then(() => {
                    const redirectUrl = urlParams.get('redirect') || 'default_page.php';
                    window.location.href = redirectUrl;
                });
            }
        });
    </script>

</body>
</html>
