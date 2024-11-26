<?php

session_start();
session_regenerate_id();
require_once "config/koneksi.php";

if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // $selectLogin = mysqli_query($koneksi, "SELECT * FROM user WHERE email = '$email' AND password = '$password'")
    $selectLogin = mysqli_query($koneksi, "SELECT * FROM user WHERE email = '$email'");
    if (mysqli_num_rows($selectLogin) > 0) {
        $row = mysqli_fetch_assoc($selectLogin);

        if ($row['email'] == $email && $row['password'] == $password) {
            $_SESSION['EMAIL'] = $row['email'];
            $_SESSION['NAMA'] = $row['nama_lengkap'];
            $_SESSION['NAMALENGKAP'] = $row['nama_lengkap'];
            header('location: kasir.php');
            exit();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap-5.3.3/dist/css/bootstrap.min.css">
    <title>Document</title>
</head>

<body>



    <div class="container justify-content-center">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        <h1>Login Brother</h1>
                    </div>
                    <div class="card-body">
                        <form action="" method="POST">
                            <div class="form-group mt-2">
                                <label for="username">Email</label>
                                <input type="email" class="form-control" id="username" name="email" placeholder="Masukkan Email Anda ..." required>
                            </div>
                            <div class="form-group mt-3">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Masukkan Password Anda ..." required>
                            </div>
                            <div class="form-group mt-3" align="right">
                                <button type="submit" name="login" class="btn btn-primary">Login</button>
                                <!-- <a href="register.php" class="btn btn-success float-right">Register</a> -->
                            </div>
                        </form>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-3"></div>
        </div>
    </div>

    <script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>