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
    $row = $check_result->fetch_assoc();
        $title = $row['title'];
        $description = $row['description'];
        $status = $row['status'];
    } else {
        echo "Unauthorized access to this task.";
        exit;
    }
} else {
    echo "Task ID not provided.";
    exit;
}
// Check if the form is submitted

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get updated task data from the form
    $title = $_POST['title'];
    $description = $_POST['description'];
    $status = $_POST['status'];

    // Update task data in the database
    $update_sql = "UPDATE tasks SET title='$title', description='$description', status='$status' WHERE id=$task_id";

    if ($conn->query($update_sql) === TRUE) {
        echo "Task updated successfully!";
        header('Location: index.php');
    } else {
        echo "Error updating task: " . $conn->error;
    }

    // Close the database connection
    $conn->close();
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Task</title>
</head>
<body>
    <h2>Edit Task</h2>


    <form method="post" action="">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="<?php echo $title; ?>" required>
        <br>

        <label for="description">Description:</label>
        <textarea id="description" name="description"><?php echo $description; ?></textarea>
        <br>

        <label for="status">Status:</label>
        <input type="text" id="status" name="status" value="<?php echo $status; ?>">
        <br>

        <input type="submit" value="Update Task">
    </form>

    <br>

    <a href="index.php">Back to Task List</a>
</body>
</html>
