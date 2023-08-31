document.addEventListener("DOMContentLoaded", function() {
        const toggleTableBtn = document.getElementById("toggleTableBtn");
        const qnaTable = document.getElementById("table1");

        toggleTableBtn.addEventListener("click", function() {
            qnaTable.classList.toggle("expanded");
        });
    });