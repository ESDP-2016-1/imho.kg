/* Set the width of the side navigation to 310px */
function openNav() {
    document.getElementById("mySidenav").style.width = "300px";
    document.getElementById("rectangle").innerHTML = "<span onclick='closeNav()' id='catalogue_action'> КАТАЛОГ </span>";
}

/* Set the width of the side navigation to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("rectangle").innerHTML = "<span onclick='openNav()' id='catalogue_action'> КАТАЛОГ </span>";
}