

<?php
session_start();
include 'connect.php';
require_once('header.php');

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id = $_SESSION['user_id']; // Get the logged-in user's ID
    $title = $_POST['title'];
    $description = $_POST['description'];
    $due_date = $_POST['due_date'];

    // Insert data into the tasks table
    $sql = "INSERT INTO tasks (user_id, title, description, due_date) VALUES ('$user_id', '$title', '$description','$due_date')";

    if ($conn->query($sql) === TRUE) {
        echo "Task added successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Task</title>
</head>
<body>
    <h2>ADD Task</h2>

    <form method="post" action="">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required>
        <br>

        <label for="description">Description:</label>
        <textarea id="description" name="description"></textarea>
        <br>

        <label for="due_date">Due Date:</label>
        <input type="date" id="due_date" name="due_date">
        <br>


        <input type="submit" value="Add Task">
    </form>
</body>
</html>

    <a href="index.php">Back to Task List</a>
</body>
</html>

<?php

 $conn->close();

?>
