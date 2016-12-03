/*  Side Bar  */

function openNav() {
    document.getElementById("mySidenav").style.width = "300px";
    document.getElementById("rectangle").innerHTML = "<span onclick='closeNav()' id='catalogue_action'> КАТАЛОГ </span>";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("rectangle").innerHTML = "<span onclick='openNav()' id='catalogue_action'> КАТАЛОГ </span>";
}
/*  SideBar END */



$(document).on('ready', function() {

    // Sort on click
    $('#sort_by_filter').change(function()
    {
        window.location = '/sorting?type=' + $(this).val();
    });


});


