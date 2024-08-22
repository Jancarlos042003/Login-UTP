<?php
        $hashedPassword = password_hash('sam', PASSWORD_BCRYPT);
        echo $hashedPassword;
    ?>