<?php
session_start();
include '../includes/config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    $stmt = $conn->prepare("SELECT id, password FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($user_id, $hashed_password);
    $stmt->fetch();

    if ($stmt->num_rows > 0 && password_verify($password, $hashed_password)) {
        $_SESSION['user_id'] = $user_id;
        header("Location: ../home.php");
        exit();
    } else {
        $error = "Invalid login credentials.";
    }
    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        <h2 class="text-2xl font-semibold text-center mb-4">Login</h2>
        <?php if (isset($error)) echo "<p class='text-red-500 text-center'>$error</p>"; ?>
        <form method="POST">
            <div class="mb-4">
                <input type="email" name="email" placeholder="Email" class="w-full px-4 py-2 border rounded-lg focus:ring focus:ring-blue-300" required>
            </div>
            <div class="mb-4">
                <input type="password" name="password" placeholder="Password" class="w-full px-4 py-2 border rounded-lg focus:ring focus:ring-blue-300" required>
            </div>
            <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600 transition">Login</button>
            <div class="text-center mt-3">
                <a href="register.php" class="text-blue-600">Don't have an account? Register</a>
            </div>
        </form>
    </div>
</div>

<?php include '../includes/footer.php'; ?>

</body>
</html>
