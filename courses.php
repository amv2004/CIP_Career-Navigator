<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career Navigator - Courses</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body class="bg-gray-100 text-gray-900">
    <!-- Header -->
    <header class="bg-blue-600 text-white p-4 shadow-lg">
        <h1 class="text-2xl font-bold text-center">Career Navigator</h1>
        <nav class="flex justify-center space-x-4 mt-2">
            <a href="home.php" class="hover:underline">Home</a>
            <a href="users/assessment.php" class="hover:underline">Update Skills</a>
            <a href="jobs/recommend_jobs.php" class="hover:underline">Recommended Jobs</a>
            <a href="planner.php" class="hover:underline">Career Planner</a>
            <a href="auth/logout.php" class="hover:underline text-red-400">Logout</a>
        </nav>
    </header>

    <!-- Main Content -->
    <div class="max-w-2xl mx-auto mt-10 p-6 bg-white rounded-lg shadow-md">
        <h1 class="text-2xl font-semibold text-center mb-4">Find Courses to Bridge Your Skill Gaps</h1>

        <!-- Form -->
        <form id="skillForm" class="flex flex-col space-y-4">
            <label for="skills" class="text-lg font-medium">Enter your skill gaps (comma-separated):</label>
            <input type="text" id="skills" name="skills" required
                   class="border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-blue-500">
            <button type="submit"
                    class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 transition">
                Find Courses
            </button>
        </form>

        <!-- Course List -->
        <div id="courseList" class="mt-6"></div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const urlParams = new URLSearchParams(window.location.search);
            const missingSkills = urlParams.get('missing_skills');

            if (missingSkills) {
                document.getElementById('skills').value = missingSkills;
                fetchCourses(missingSkills);
            }
        });

        document.getElementById('skillForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const skills = document.getElementById('skills').value;
            fetchCourses(skills);
        });

        function fetchCourses(skills) {
            fetch(`get_courses.php?skills=${encodeURIComponent(skills)}`)
                .then(response => response.json())
                .then(data => {
                    console.log("Fetched Data:", data); // Debugging

                    let output = '<h2 class="text-xl font-semibold mb-2">Recommended Courses:</h2>';
                    if (!data || data.length === 0 || data.error) {
                        output += "<p class='text-gray-500'>No courses found for the given skills.</p>";
                    } else {
                        data.forEach(course => {
                            output += `
                                <div class="bg-gray-100 p-4 rounded-lg shadow-md mb-2">
                                    <p class="font-bold">${course.title}</p>
                                    <p class="text-gray-600">${course.price}</p>
                                    <p class="text-yellow-500">Rating: ${course.rating}</p>
                                    <a href="${course.url}" target="_blank" class="text-blue-500 hover:underline">Enroll Now</a>
                                    <button onclick="addToPlanner('${course.title}', '${course.url}')"
                                        class="bg-green-500 text-white px-3 py-1 rounded mt-2 hover:bg-green-600">
                                        Add to Planner
                                    </button>
                                </div>
                            `;
                        });
                    }
                    document.getElementById('courseList').innerHTML = output;
                })
                .catch(error => {
                    console.error('Error fetching courses:', error);
                    document.getElementById('courseList').innerHTML = "<p class='text-red-500'>Error loading courses.</p>";
                });
        }

        function addToPlanner(courseTitle, courseUrl) {
    fetch('add_to_planner.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `course_title=${encodeURIComponent(courseTitle)}&course_url=${encodeURIComponent(courseUrl)}`
    })
    .then(response => response.text())
    .then(data => {
        alert(data); // Shows success or error message
    })
    .catch(error => {
        console.error('Error adding course:', error);
    });
}

    </script>
</body>
</html>
