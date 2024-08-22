<?php
session_start();

if (!isset($_SESSION['username']) || $_SESSION['role'] !== 'Estudiante') {
    header("Location: login.php"); 
    exit();
}

$username = $_SESSION['username'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UTP</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/sty.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="../img/logo.png" alt="UTP Logo" style="height: 40px;">
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu" aria-controls="offcanvasMenu">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav align-items-center">
                    <li class="nav-item dropdown d-flex align-items-center">
                        <div class="d-flex flex-column me-2">
                            <h6 class="m-0 text-end">Bienvenido, <?php echo htmlspecialchars($_SESSION['nombreCompleto']); ?> </h6>
                            <small class="text-muted text-end"><?php echo htmlspecialchars($_SESSION['role']); ?></small>
                        </div>
                        <img src="../img/user_avatar.png" alt="avatar" width="40" height="40" class="rounded-circle ms-2">

                        <a href="#" class="nav-link" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-chevron-down chevron-icon"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end mt-3" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="logout.php">Cerrar sesión</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasMenu" aria-labelledby="offcanvasMenuLabel">
        <div class="offcanvas-header">
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body text-center">
            <div class="user-info">
                <img src="../img/user_avatar.png" alt="avatar" width="80" height="80" class="rounded-circle mb-2">
                <h6 class="m-0"><?php echo htmlspecialchars($_SESSION['nombreCompleto']); ?></h6>
                <small class="text-muted"><?php echo htmlspecialchars($_SESSION['role']); ?></small>
            </div>
            <hr>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center justify-content-center" href="logout.php">
                        <i class="bi bi-box-arrow-right fs-4 me-2"></i> Cerrar sesión
                    </a>
                </li>
            </ul>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="../js/sty.js"></script>
</body>
</html>
