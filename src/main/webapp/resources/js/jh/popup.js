// 팝업 열기
function openPopup() {
  let popup = document.getElementById("regProductPopup");
  let dim = document.getElementById("dim-for-reg");
  popup.style.display = "block";
  dim.style.display = "block";
}

// 팝업 닫기
function closePopup() {
  let popup = document.getElementById("regProductPopup");
  let dim = document.getElementById("dim-for-reg");
  popup.style.display = "none";
  dim.style.display = "none";
}

function loadPopup() {
  let popup = document.getElementById("regProductPopup");
  let dim = document.getElementById("dim-for-reg");
  popup.addEventListener("click", openPopup);
  dim.addEventListener("click", closePopup);
  }

    window.addEventListener("load", loadPopup);