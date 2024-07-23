<?php
session_start();
include 'connect.php';
require_once('header.php');

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

// Check if the task ID is provided in the URL
if (isset($_GET['id'])) {
    $task_id = $_GET['id'];

    // Check if the task belongs to the logged-in user
    $user_id = $_SESSION['user_id'];
    $check_sql = "SELECT * FROM tasks WHERE id = '$task_id' AND user_id = '$user_id'";
    $check_result = $conn->query($check_sql);

    if ($check_result->num_rows > 0) {
        $delete_sql = "DELETE FROM tasks WHERE id = $task_id";

        if ($conn->query($delete_sql) === TRUE) {
            echo "Task deleted successfully!";
        } else {
            echo "Error deleting task: " . $conn->error;
        }
    } else {
        echo "Unauthorized access to this task.";
        exit;
    }
} else {
    echo "Task ID not provided.";
    exit;
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Task</title>
</head>
<body>
    <br>

    <a href="index.php">Back to Task List</a>
</body>
</html>
