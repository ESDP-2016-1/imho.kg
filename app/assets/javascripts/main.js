
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



});


/*  ГОВНОКОД  */


/*
 $ ->
 $("form#sign_in_user, form#sign_up_user").bind("ajax:success", (event, xhr, settings) ->
 $(this).parents('.modal').modal('hide')
 ).bind("ajax:error", (event, xhr, settings, exceptions) ->
 error_messages = if xhr.responseJSON['error']
 "<div class='alert alert-danger pull-left'>" + xhr.responseJSON['error'] + "</div>"
 else if (xhr.responseJSON['errors']) {
 $.map(xhr.responseJSON["errors"], (v, k) - >
 "<div class='alert alert-danger pull-left'>" + k + " " + v + "</div>"
 ).join("")
 }
 else
 "<div class='alert alert-danger pull-left'>Unknown error</div>"
 $(this).parents('.modal').children('.modal-footer').html(error_messages)
 );
 */

/*   ГОВНОКОД END   */