<?php
$host = "localhost";
$user = "root";  // Change if needed
$password = "";  // Set your database password
$dbname = "career_navigator";

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
