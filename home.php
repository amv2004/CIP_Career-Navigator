<?php
session_start();
include 'includes/config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: auth/login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career Navigator</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Custom CSS (Optional) -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body class="bg-gray-100 flex flex-col min-h-screen">
<header class="bg-blue-600 text-white p-4 shadow-md">
    <div class="container mx-auto flex justify-between items-center">
        <h1 class="text-2xl font-bold">Career Navigator</h1>
        <nav class="space-x-4">
            <a href="home.php" class="hover:underline">Home</a>
            <a href="users/assessment.php" class="hover:underline">Update Skills</a>
            <a href="jobs/recommend_jobs.php" class="hover:underline">Recommended Jobs</a>
            <a href="planner.php" class="hover:underline">Course Planner</a>
            <a href="auth/logout.php" class="hover:underline">Logout</a>
        </nav>
    </div>
</header>

<!-- Main Content -->
<main class="flex-grow flex flex-col items-center justify-center text-center mt-10">
    <img src="images.png" alt="Image" class="w-52 h-52 rounded-lg shadow-lg">
    
    <h2 class="text-2xl font-semibold text-gray-800 mt-6">Welcome to Career Navigator!</h2>
    
    <a href="jobs/recommend_jobs.php" class="mt-6">
        <button class="bg-blue-600 text-white px-6 py-2 rounded-lg shadow-md hover:bg-blue-700 transition">
            View Recommended Jobs
        </button>
    </a>
</main>

<!-- Footer -->
<footer class="mt-auto">
    <?php include 'includes/footer.php'; ?>
</footer>

</body>
</html>
