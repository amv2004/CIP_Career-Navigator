<?php
session_start();
include '../includes/config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: ../auth/login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Fetch existing skills
$stmt = $conn->prepare("SELECT skills FROM users WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
$existing_skills = $user['skills'] ?? '';
$stmt->close();

// Process form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $new_skills = trim($_POST['skills']);

    // Convert to arrays (lowercase and trimmed)
    $existing_skills_array = array_map('mb_strtolower', array_map('trim', explode(',', $existing_skills)));
    $new_skills_array = array_map('mb_strtolower', array_map('trim', explode(',', $new_skills)));

    // Merge new skills with existing skills
    $merged_skills = array_unique(array_merge($existing_skills_array, $new_skills_array));

    // Convert back to a string
    $final_skills = implode(', ', $merged_skills);

    // Update skills in database
    $stmt = $conn->prepare("UPDATE users SET skills = ? WHERE id = ?");
    $stmt->bind_param("si", $final_skills, $user_id);
    $stmt->execute();
    $stmt->close();

    // Refresh skills list
    $existing_skills = $final_skills;
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
    <h2 class="text-xl font-bold text-gray-800 mb-4 text-center">Update Your Skills</h2>

    <!-- Skills Update Form -->
    <form method="POST" class="space-y-4">
        <label for="skills" class="block text-gray-700 font-medium">
            Enter Additional Skills (comma-separated):
        </label>
        <textarea name="skills" rows="4" required
                  class="w-full p-2 border rounded-lg focus:outline-none focus:ring focus:ring-blue-300"></textarea>

        <button type="submit"
                class="w-full bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700 transition">
            Add Skills
        </button>
    </form>

    <!-- Display Current Skills -->
    <h3 class="text-lg font-semibold mt-6">Your Current Skills:</h3>
    <p class="bg-gray-200 p-3 rounded-lg mt-2">
        <?php echo htmlspecialchars($existing_skills) ?: "No skills added yet."; ?>
    </p>
</main>

<?php include '../includes/footer.php'; ?>
</body>
</html>
