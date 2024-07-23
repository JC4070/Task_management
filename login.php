<?php
session_start();

include 'connect.php';
require_once('header.php');

$errors = array();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Server-side validation
    if (empty($email)) {
        $errors['email'] = "Email cannot be empty.";
    } elseif (!preg_match("/^([a-zA-Z\._]+@[a-zA-Z]+\.[a-zA-Z]+)$/", $email)) {
        $errors['email'] = "Please enter a valid email.";
    }

    if (strlen($password) < 3) {
        $errors['password'] = "Password should be at least 3 characters long.";
    }

    if (empty($errors)) {
        // Proceed with database query only if validation passes
        $sql = "SELECT id, email, password FROM users WHERE email='$email'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            if (password_verify($password, $row['password'])) {
                // Login successful
                $_SESSION['user_id'] = $row['id'];
                $_SESSION['email'] = $row['email'];
                header('Location: index.php'); // Redirect to the main page after successful login
                exit;
            } else {
                $errors['password'] = "Invalid password.";
            }
        } else {
            $errors['email'] = "User not found.";
        }
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>

</head>
<body>
    <br>
    <h2>User Login</h2>

    <div class="container">

        <div id="Login_innerForm">
            <form method="post" action="">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" >
                <?php if (isset($errors['email'])) {
                    echo "<p style='color: red;'>{$errors['email']}</p>";
                } ?>
                <br>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" >
                <?php if (isset($errors['password'])) {
                    echo "<p style='color: red;'>{$errors['password']}</p>";
                } ?>
                <br>

                <input type="submit" value="Login">
                <a href="credential.php">Don't have an account? Register here.</a>
            </form>
        </div>
    </div>
    <br>

    <?php include('footer.php'); ?>
</body>
</html>
