<?php
session_start();
include '../includes/config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $stmt = $conn->prepare("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $username, $email, $password);

    if ($stmt->execute()) {
        header("Location: login.php");
        exit();
    } else {
        $error = "Error registering user.";
    }
    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col items-center min-h-screen">

<header class="bg-blue-600 text-white w-full p-4">
    <div class="container mx-auto flex justify-between">
        <h1 class="text-xl font-semibold">Career Navigator</h1>
        <nav>
            <a href="../home.php" class="text-white mx-2">Home</a>
            <a href="../users/assessment.php" class="text-white mx-2">Update Skills</a>
            <a href="../jobs/recommend_jobs.php" class="text-white mx-2">Recommended Jobs</a>
            <a href="../planner.php" class="hover:underline">Course Planner</a>
            <a href="../auth/logout.php" class="text-white mx-2">Logout</a>
        </nav>
    </div>
</header>

<div class="flex items-center justify-center w-full flex-grow">
    <div class="bg-white p-6 rounded-lg shadow-lg w-96">
        <h2 class="text-2xl font-semibold text-center mb-4">Register</h2>
        <form method="POST">
            <div class="mb-4">
                <input type="text" name="username" placeholder="Username" class="w-full px-4 py-2 border rounded-lg focus:ring focus:ring-blue-300" required>
            </div>
            <div class="mb-4">
                <input type="email" name="email" placeholder="Email" class="w-full px-4 py-2 border rounded-lg focus:ring focus:ring-blue-300" required>
            </div>
            <div class="mb-4">
                <input type="password" name="password" placeholder="Password" class="w-full px-4 py-2 border rounded-lg focus:ring focus:ring-blue-300" required>
            </div>
            <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600 transition">Register</button>
            <div class="text-center mt-3">
                <a href="login.php" class="text-blue-600">Already have an account? Login</a>
            </div>
        </form>
    </div>
</div>

<?php include '../includes/footer.php'; ?>

</body>
</html>
