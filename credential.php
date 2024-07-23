<?php
include 'connect.php';
require_once('header.php');
$errors = array();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $email=$_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

// Check if the email already exists in the database
$checkEmailSql = "SELECT * FROM users WHERE email = '$email'";
$result = $conn->query($checkEmailSql);
if ($result->num_rows > 0) {
    $errors['email'] = "Error: Email already exists.";
} else {
    // Email doesn't exist, proceed with registration
    $sql = "INSERT INTO users (username, email, password) VALUES ('$username','$email', '$password')";

    if ($conn->query($sql) === TRUE) {
        echo "Registration successful!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>

</head>
<body id="res_form">
    <br>
    <h2>User Registration</h2>

    <div class="container">
        <div id="res_innerForm">
        <form method="post" action="" >

        <div class = "login-er">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username">
        </div>

        <div class = "email-er">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email">
        </div>

        <div class = "pass-er">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password">
        </div>
        <div class = "pass2-er">
            <label for="pass2">Re-type Password:</label>
                <input type="password" id="pass2">
        </div>

                <button type="submit">Sign-Up</button>
            <a href="login.php">Already have an account? Login here.</a>
            </form>
</div>
    </div>
    <?php include('footer.php'); ?>
    <script src="credntial.js"></script>
</body>
</html>

