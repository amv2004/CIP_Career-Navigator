<?php
// Coursera API credentials
$api_url = "https://api.coursera.org/api/courses.v1";
$api_key = "8fdPEFGumagustBn1fif5Kv7mNaBBGtcFGlHl46x4ukEnyAG"; // Replace with your Coursera API key

// Get missing skills from query parameter
$skills = isset($_GET['skills']) ? $_GET['skills'] : '';
$skills_array = array_map('trim', explode(',', $skills));

// Initialize a curl session
$curl = curl_init();
$all_courses = [];

foreach ($skills_array as $skill) {
    if (!empty($skill)) {
        curl_setopt_array($curl, [
            CURLOPT_URL => $api_url . "?q=search&query=" . urlencode($skill) . "&limit=5", // Adjust parameters accordingly
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => [
                "Authorization: Bearer $api_key"
            ],
        ]);

        $response = curl_exec($curl);
        $data = json_decode($response, true);

        if (isset($data['elements'])) {
            foreach ($data['elements'] as $course) {
                $all_courses[] = [
                    'title' => $course['name'],
                    'url' => "https://www.coursera.org/learn/" . $course['slug'],
                    'rating' => isset($course['averageRating']) ? $course['averageRating'] : 'N/A',
                    'price' => 'Free', // Coursera courses are typically free to audit, but might require payment for certificates
                ];
            }
        }
    }
}

curl_close($curl);

// Return courses as JSON for frontend use
header('Content-Type: application/json');
echo json_encode($all_courses);
?>
