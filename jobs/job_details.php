<?php
session_start();
include '../includes/config.php';

if (!isset($_SESSION['user_id']) || !isset($_GET['id'])) {
    header("Location: ../auth/login.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$job_id = $_GET['id'];

// Fetch user skills
$stmt = $conn->prepare("SELECT skills FROM users WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
$user_skills_raw = $user['skills'] ?? '';
$stmt->close();

// Fetch job details
// Fetch job details (remove 'description' if it's not in the database)
$stmt = $conn->prepare("SELECT title, skills_required, job_url FROM jobs WHERE id = ?");
$stmt->bind_param("i", $job_id);
$stmt->execute();
$result = $stmt->get_result();
$job = $result->fetch_assoc();
$stmt->close();

$title = $job['title'] ?? 'Job Title Not Available';
$description = $job['description'] ?? 'No description available.';
$job_skills_raw = $job['skills_required'] ?? '';
$url = $job['job_url'] ?? '#';

// Convert skills into trimmed, lowercase arrays
$user_skills = array_map('mb_strtolower', array_map('trim', explode(',', $user_skills_raw)));
$job_skills = array_map('mb_strtolower', array_map('trim', explode(',', $job_skills_raw)));

// Remove empty values
$user_skills = array_filter($user_skills);
$job_skills = array_filter($job_skills);

// Find missing skills
$missing_skills = array_diff($job_skills, $user_skills);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Details - Career Navigator</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-900">
<header class="bg-blue-600 text-white p-4 shadow-lg">
    <h1 class="text-2xl font-bold text-center">Career Navigator</h1>
    <nav class="flex justify-center space-x-4 mt-2">
        <a href="../home.php" class="hover:underline">Home</a>
        <a href="../users/assessment.php" class="hover:underline">Update Skills</a>
        <a href="../jobs/recommend_jobs.php" class="hover:underline">Recommended Jobs</a>
        <a href="../planner.php" class="hover:underline">Course Planner</a>
        <a href="../auth/logout.php" class="hover:underline text-red-400">Logout</a>
    </nav>
</header>

<div class="max-w-2xl mx-auto mt-10 p-6 bg-white rounded-lg shadow-md">
    <h2 class="text-2xl font-semibold text-center mb-4"><?php echo htmlspecialchars($title); ?></h2>
    <p class="text-gray-700 mb-4"><?php echo nl2br(htmlspecialchars($description)); ?></p>

    <h3 class="text-lg font-medium">Required Skills:</h3>
    <ul class="list-disc list-inside mb-4">
        <?php foreach ($job_skills as $skill): ?>
            <li class="text-gray-700"><?php echo htmlspecialchars($skill); ?></li>
        <?php endforeach; ?>
    </ul>

    <h3 class="text-lg font-medium">Missing Skills:</h3>
    <?php if (empty($missing_skills)): ?>
        <p class="text-green-600 font-semibold">None! You qualify for this job.</p>
    <?php else: ?>
        <ul class="list-disc list-inside text-red-500">
            <?php foreach ($missing_skills as $skill): ?>
                <li><?php echo htmlspecialchars($skill); ?></li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>

    <div class="mt-6 flex flex-col space-y-4">
        <?php if (!empty($missing_skills)): ?>
            <a href="../courses.php?missing_skills=<?php echo urlencode(implode(',', $missing_skills)); ?>">
                <button class="w-full bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 transition">
                    Find Courses to Learn Missing Skills
                </button>
            </a>
        <?php endif; ?>
        <a href="<?php echo htmlspecialchars($url); ?>" target="_blank">
            <button class="w-full bg-green-600 text-white px-4 py-2 rounded-md hover:bg-green-700 transition">
                Apply for the Job
            </button>
        </a>
    </div>
</div>

<?php include '../includes/footer.php'; ?>
</body>
</html>
