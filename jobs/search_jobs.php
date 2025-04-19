<?php
session_start();
include '../includes/config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: ../auth/login.php");
    exit();
}

$search = isset($_GET['q']) ? strtolower($_GET['q']) : '';

$stmt = $conn->prepare("SELECT * FROM jobs WHERE LOWER(title) LIKE ?");
$searchTerm = "%$search%";
$stmt->bind_param("s", $searchTerm);
$stmt->execute();
$result = $stmt->get_result();
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
    <h2 class="text-xl font-bold text-gray-800 mb-4 text-center">Search Jobs</h2>

    <!-- Search Form -->
    <form method="GET" class="flex items-center justify-center mb-6">
        <input type="text" name="q" placeholder="Search job titles..."
               value="<?php echo htmlspecialchars($search); ?>"
               class="p-2 border rounded-lg w-1/2 focus:outline-none focus:ring focus:ring-blue-300">
        <button type="submit"
                class="ml-2 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition">
            Search
        </button>
    </form>

    <!-- Job Listings -->
    <ul class="space-y-3">
        <?php while ($job = $result->fetch_assoc()): ?>
            <li class="p-4 bg-gray-200 rounded-md hover:bg-gray-300 transition">
                <a href="job_details.php?id=<?php echo $job['id']; ?>" class="text-blue-600 font-semibold">
                    <?php echo htmlspecialchars($job['title']); ?>
                </a>
            </li>
        <?php endwhile; ?>
    </ul>
</main>

<?php include '../includes/footer.php'; ?>
</body>
</html>
