<?php
session_start();
include 'db_connect.php'; // Ensure the correct path

// Ensure user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: ../auth/login.php");
    exit;
}

$user_id = $_SESSION['user_id'];
$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

// Fetch In-Progress Courses
$query = "SELECT * FROM planner WHERE user_id = ? AND status = 'in_progress'";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result_in_progress = $stmt->get_result();
$in_progress_courses = $result_in_progress->fetch_all(MYSQLI_ASSOC);
$stmt->close();

// Fetch Completed Courses
$query = "SELECT * FROM planner WHERE user_id = ? AND status = 'completed'";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result_completed = $stmt->get_result();
$completed_courses = $result_completed->fetch_all(MYSQLI_ASSOC);
$stmt->close();

// Fetch Monthly Data for Charts
$query = "
    SELECT 
        DATE_FORMAT(added_date, '%Y-%m') AS month, 
        COUNT(*) AS added_count,
        SUM(CASE WHEN status = 'completed' THEN 1 ELSE 0 END) AS completed_count
    FROM planner 
    WHERE user_id = ? 
    GROUP BY month 
    ORDER BY month ASC";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result_chart = $stmt->get_result();

$months = [];
$added_counts = [];
$completed_counts = [];

while ($row = $result_chart->fetch_assoc()) {
    $months[] = $row['month'];
    $added_counts[] = $row['added_count'];
    $completed_counts[] = $row['completed_count'];
}

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career Planner</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
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
    <h1 class="text-2xl font-bold text-center text-blue-600 mb-6">Career Planner</h1>

    <div class="max-w-4xl mx-auto bg-white p-6 rounded-lg shadow-md">
        <!-- In Progress Courses -->
        <h2 class="text-xl font-semibold mb-4 text-blue-700">Courses In Progress</h2>
        <ul id="inProgressList" class="mb-6">
            <?php if (count($in_progress_courses) > 0): ?>
                <?php foreach ($in_progress_courses as $course): ?>
                    <li class="bg-gray-200 p-4 mb-2 rounded-lg flex justify-between items-center">
                        <div>
                            <p class="font-bold"><?php echo htmlspecialchars($course['course_title']); ?></p>
                            <a href="<?php echo htmlspecialchars($course['course_url']); ?>" class="text-blue-500 hover:underline" target="_blank">View Course</a>
                        </div>
                        <button class="bg-green-500 text-white px-4 py-2 rounded mark-completed"
                                data-course-id="<?php echo $course['id']; ?>">
                            Mark Completed
                        </button>
                    </li>
                <?php endforeach; ?>
            <?php else: ?>
                <p class="text-gray-500">No courses in progress.</p>
            <?php endif; ?>
        </ul>

        <!-- Completed Courses -->
        <h2 class="text-xl font-semibold mb-4 text-green-700">Completed Courses</h2>
        <ul id="completedList" class="mb-6">
            <?php if (count($completed_courses) > 0): ?>
                <?php foreach ($completed_courses as $course): ?>
                    <li class="bg-green-200 p-4 mb-2 rounded-lg">
                        <p class="font-bold"><?php echo htmlspecialchars($course['course_title']); ?></p>
                        <a href="<?php echo htmlspecialchars($course['course_url']); ?>" class="text-blue-500 hover:underline" target="_blank">View Course</a>
                    </li>
                <?php endforeach; ?>
            <?php else: ?>
                <p class="text-gray-500">No completed courses yet.</p>
            <?php endif; ?>
        </ul>

        <!-- Visualization Section -->
        <h2 class="text-xl font-semibold mb-4 text-blue-600">Course Progress Visualization</h2>
        <canvas id="progressChart" class="mb-6"></canvas>
        <canvas id="completedGrowthChart"></canvas>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Mark Course as Completed
            document.querySelectorAll('.mark-completed').forEach(button => {
                button.addEventListener('click', function () {
                    let courseId = this.getAttribute('data-course-id');

                    fetch('mark_completed.php', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                        body: `course_id=${courseId}`
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            alert('Course marked as completed!');
                            location.reload(); // Refresh to update lists
                        } else {
                            alert('Error: ' + data.error);
                        }
                    })
                    .catch(error => console.error('Error:', error));
                });
            });

            // Data for Bar Chart (Courses Per Month)
            const months = <?php echo json_encode($months); ?>;
            const addedCounts = <?php echo json_encode($added_counts); ?>;
            const completedCounts = <?php echo json_encode($completed_counts); ?>;

            // Cumulative Completed Courses Over Time
            let cumulativeCompleted = [];
            completedCounts.reduce((acc, val, i) => cumulativeCompleted[i] = acc + val, 0);

            // Bar Chart for Courses Per Month
            const ctx1 = document.getElementById('progressChart').getContext('2d');
            new Chart(ctx1, {
                type: 'bar',
                data: {
                    labels: months,
                    datasets: [
                        { label: 'Courses Added', data: addedCounts, backgroundColor: 'rgba(54, 162, 235, 0.6)' },
                        { label: 'Courses Completed', data: completedCounts, backgroundColor: 'rgba(75, 192, 192, 0.6)' }
                    ]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            min: 0,
                            max: 10,
                            ticks: {
                                stepSize: 1,
                                callback: function(value) {
                                    return value + " courses";
                                }
                            }
                        }
                    }
                }
            });

            // Line Graph for Completed Courses Growth Over Time
            const ctx2 = document.getElementById('completedGrowthChart').getContext('2d');
            new Chart(ctx2, {
                type: 'line',
                data: {
                    labels: months,
                    datasets: [{
                        label: 'Cumulative Completed Courses',
                        data: cumulativeCompleted,
                        borderColor: 'rgba(75, 192, 192, 1)',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderWidth: 2,
                        fill: true
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            min: 0,
                            max: 10,
                            ticks: {
                                stepSize: 1
                            }
                        }
                    }
                }
            });
        });
    </script>
</body>
</html>
