//Fő function
function search() {
    //warningMessage();
    selector();
}

function selector() {
    if (document.getElementById('ChkOdometer').checked) {
        document.getElementById("formFrsz").action = "../api/requestodometer.php";
    } else if (document.getElementById('ChkInfos').checked) {
        document.getElementById("formFrsz").action = "../api/request.php";
    }
    
}

function warningMessage() {
    alert('Felhívjuk a figyelmét, hogy a lekérdezések naplózásra kerülnek a rendszerben, amely egy egyedi azonosítóval lesz ellátva.')
}