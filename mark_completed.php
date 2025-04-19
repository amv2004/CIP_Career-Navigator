<?php
session_start();
include 'db_connect.php'; // Adjust the path as per your structure

// Ensure user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode(["error" => "Unauthorized"]);
    exit;
}

$user_id = $_SESSION['user_id'];
$course_id = isset($_POST['course_id']) ? intval($_POST['course_id']) : 0;

if ($course_id > 0) {
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

    if ($conn->connect_error) {
        die(json_encode(["error" => "Database connection failed"]));
    }

    $query = "UPDATE planner SET status='completed', completed_date=CURDATE() WHERE id=? AND user_id=?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ii", $course_id, $user_id);

    if ($stmt->execute()) {
        echo json_encode(["success" => "Course marked as completed"]);
    } else {
        echo json_encode(["error" => "Failed to update course"]);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["error" => "Invalid course ID"]);
}
?>
