document.addEventListener("DOMContentLoaded", function() {
    console.log("JavaScript Loaded");

    const searchInput = document.getElementById("search");
    const jobCards = document.querySelectorAll(".job-card");

    if (searchInput) {
        searchInput.addEventListener("input", function() {
            const searchText = searchInput.value.toLowerCase();

            jobCards.forEach(card => {
                const title = card.querySelector("h3").textContent.toLowerCase();
                if (title.includes(searchText)) {
                    card.style.display = "block";
                } else {
                    card.style.display = "none";
                }
            });
        });
    }
});
