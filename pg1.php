<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career Navigator</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <div class="bg-white p-12 rounded-lg shadow-lg w-full max-w-5xl text-center">
        <h1 class="text-5xl font-bold text-blue-600">Welcome to Career Navigator</h1>
        <p class="text-gray-700 mt-4 text-xl">Find the perfect career path with personalized job recommendations and skill analysis.</p>
        
        <div class="mt-10 grid grid-cols-1 md:grid-cols-3 gap-6">
            <!-- User Review 1 -->
            <div class="bg-gray-50 p-6 rounded-lg shadow-md">
                <img src="assets/user1.png" alt="User 1" class="w-24 h-24 mx-auto rounded-full">
                <p class="mt-4 text-gray-800 font-semibold text-2xl">MuthuVaishnavi Anand</p>
                <p class="text-lg text-gray-600 mt-2">"A fantastic platform! Helped me land my dream job."</p>
            </div>
            
            <!-- User Review 2 -->
            <div class="bg-gray-50 p-6 rounded-lg shadow-md">
                <img src="assets/user2.png" alt="User 2" class="w-24 h-24 mx-auto rounded-full">
                <p class="mt-4 text-gray-800 font-semibold text-2xl">Nithiyadharshini</p>
                <p class="text-lg text-gray-600 mt-2">"Highly recommended for job seekers and career growth!"</p>
            </div>

            <!-- User Review 3 -->
            <div class="bg-gray-50 p-6 rounded-lg shadow-md">
                <img src="assets/user3.png" alt="User 3" class="w-24 h-24 mx-auto rounded-full">
                <p class="mt-4 text-gray-800 font-semibold text-2xl">Sreenithika</p>
                <p class="text-lg text-gray-600 mt-2">"Helped me identify skill gaps and improve my profile!"</p>
            </div>
        </div>

        <a href="auth/login.php" class="mt-10 inline-block bg-blue-600 text-white px-10 py-4 text-2xl rounded-lg hover:bg-blue-700 transition">
            Get Started
        </a>
    </div>

</body>
</html>
