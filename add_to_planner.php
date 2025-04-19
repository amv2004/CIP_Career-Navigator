<?php
session_start();
include 'db_connect.php'; // Ensure this file connects to your DB

if (!isset($_SESSION['user_id'])) {
    die("Error: User not logged in.");
}

$user_id = $_SESSION['user_id'];
$course_title = $_POST['course_title'] ?? '';
$course_url = $_POST['course_url'] ?? '';

if (empty($course_title) || empty($course_url)) {
    die("Error: Missing course details.");
}

// Insert into planner table
$sql = "INSERT INTO planner (user_id, course_title, course_url) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iss", $user_id, $course_title, $course_url);

if ($stmt->execute()) {
    echo "Success: Course added to planner.";
} else {
    echo "Error: Could not add course.";
}

$stmt->close();
$conn->close();
?>
