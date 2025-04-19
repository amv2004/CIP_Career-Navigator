<?php
session_start();
include '../includes/config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: ../auth/login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Fetch user skills
$stmt = $conn->prepare("SELECT skills FROM users WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
$user_skills = array_map('trim', explode(',', strtolower($user['skills'] ?? '')));
$stmt->close();

// Fetch all jobs
$stmt = $conn->prepare("SELECT * FROM jobs");
$stmt->execute();
$result = $stmt->get_result();

$matching_jobs = [];
while ($job = $result->fetch_assoc()) {
    $job_skills = array_map('trim', explode(',', strtolower($job['skills_required'])));
    if (array_intersect($user_skills, $job_skills)) {
        $matching_jobs[] = $job;
    }
}
$stmt->close();
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

<body class="bg-gray-100">
<header class="bg-blue-600 text-white p-4 shadow-md">
    <div class="container mx-auto flex justify-between items-center">
        <h1 class="text-2xl font-bold">Career Navigator</h1>
        <nav class="space-x-4">
            <a href="../home.php" class="hover:underline">Home</a>
            <a href="../users/assessment.php" class="hover:underline">Update Skills</a>
            <a href="../jobs/recommend_jobs.php" class="hover:underline">Recommended Jobs</a>
            <a href="../planner.php" class="hover:underline">Course Planner</a>
            <a href="../auth/logout.php" class="hover:underline">Logout</a>
        </nav>
    </div>
</header>

<main class="container mx-auto mt-10 p-6 bg-white shadow-md rounded-lg">
    <h2 class="text-xl font-bold text-gray-800 mb-4 text-center">Jobs Matching Your Skills</h2>
    <ul class="space-y-3">
        <?php if (!empty($matching_jobs)): ?>
            <?php foreach ($matching_jobs as $job): ?>
                <li class="p-4 bg-gray-200 rounded-md hover:bg-gray-300 transition">
                    <a href="job_details.php?id=<?php echo $job['id']; ?>" class="text-blue-600 font-semibold">
                        <?php echo htmlspecialchars($job['title']); ?>
                    </a>
                </li>
            <?php endforeach; ?>
        <?php else: ?>
            <li class="text-red-500 font-medium">No jobs found matching your skills.</li>
        <?php endif; ?>
    </ul>
</main>

<?php include '../includes/footer.php'; ?>
</body>
</html>
