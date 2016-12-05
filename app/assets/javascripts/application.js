
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require active_admin.js.coffee
//= require ckeditor/init

function FavoritesAdd(id){
    $.post("/favorites",
        { comment_id: id },
        null);
}

$(document).ready(function(){
   $(".search-class").click(function(event){
       event.stopPropagation();
       alert("Ещё не готово!");
   });
});