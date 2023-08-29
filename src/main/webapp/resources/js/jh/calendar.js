let date = new Date();
let year = date.getFullYear();
let month = date.getMonth();

const day = document.querySelector(".calendar-dates");
const currdate = document.querySelector(".calendar-current-date");
const prenexIcons = document.querySelectorAll(".calendar-navigation span");

const months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
];

const manipulate = () => {
    let dayone = new Date(year, month, 1).getDay();
    let lastdate = new Date(year, month + 1, 0).getDate();
    let dayend = new Date(year, month, lastdate).getDay();
    let monthlastdate = new Date(year, month, 0).getDate();
    let lit = "";

    for (let i = dayone; i > 0; i--) {
        lit += `<li class="inactive">${monthlastdate - i + 1}</li>`;
    }

    for (let i = 1; i <= lastdate; i++) {
        let isToday = i === date.getDate()
            && month === new Date().getMonth()
            && year === new Date().getFullYear()
            ? "active"
            : "";
        lit += `<li class="${isToday}">${i}</li>`;
    }

    for (let i = dayend; i < 6; i++) {
        lit += `<li class="inactive">${i - dayend + 1}</li>`
    }

    currdate.innerText = `${months[month]} ${year}`;

    day.innerHTML = lit;

    attachDateItemListeners();
};

function attachDateItemListeners() {
    const dateItems = document.querySelectorAll(".calendar-dates li");

    dateItems.forEach(dateItem => {
        dateItem.addEventListener("click", () => {
            const selectedDate = dateItem.innerText; // 선택한 날짜
            const selectedMonth = month; // 선택한 월
            const selectedYear = year; // 선택한 연도

            // 선택한 날짜로 정보 요청
            const formattedDate = `${selectedYear}-${(selectedMonth + 1).toString().padStart(2, '0')}-${selectedDate.padStart(2, '0')}`;
            loadInfo(formattedDate);

            // 선택한 날짜를 형식에 맞게 표시
            $("#selected-date").text(formattedDate);
            $("#inputDate").val(formattedDate);
        });
    });
}
function formatCurrency(amount, currencyCode = "KRW") {
    return new Intl.NumberFormat("en-US", {
        style: "currency",
        currency: currencyCode
    }).format(amount);
}

// 받은 데이터를 화면에 표시하는 함수
function displayInfo(data) {
    const totalCostValue = data[0] && data[0].totalCost ? formatCurrency(data[0].totalCost) : formatCurrency(0);
    const totalSalesValue = data[0] && data[0].totalSales ? formatCurrency(data[0].totalSales) : formatCurrency(0);
    const totalMarginValue = data[0] && data[0].totalMargin ? formatCurrency(data[0].totalMargin) : formatCurrency(0);
    const marginPercentValue = data[0]?.totalMarginByPercent ? `${Number(data[0].totalMarginByPercent).toFixed(2)}%` : '0%';

    $("#totalCost").text(totalCostValue);
    $("#totalSales").text(totalSalesValue);
    $("#totalMargin").text(totalMarginValue);
    $("#totalMarginByPercent").text(marginPercentValue);

    $("#inputTotalSales").val(data[0]?.totalSales || 0);
    $("#inputTotalCost").val(data[0]?.totalCost || 0);
    $("#inputTotalMargin").val(data[0]?.totalMargin || 0);
}


function loadInfo(date) {
    $.ajax({
        type: "POST",
        url: "getMargin", 
        data: { "date": date },
        dataType: "json",
        success: function (data) {
            console.log(data);
            displayInfo(data); 
        },
        error: function (request, status, error) {
            console.log("code:" + request.status + "\n"
                + "message:" + request.responseText + "\n"
                + "error:" + error);
        }
    });
}

prenexIcons.forEach(icon => {
    icon.addEventListener("click", () => {
        month = icon.id === "calendar-prev" ? month - 1 : month + 1;

        if (month < 0 || month > 11) {
            date = new Date(year, month, new Date().getDate());

            year = date.getFullYear();

            month = date.getMonth();
        } else {
            date = new Date();
        }

        manipulate();
    });
});

// 초기 실행
manipulate();