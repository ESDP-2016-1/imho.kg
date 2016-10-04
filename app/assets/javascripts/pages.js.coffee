# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("form#sign_in_user, form#sign_up_user").bind("ajax:success", (event, xhr, settings) ->
    $(this).parents('.modal').modal('hide')
  ).bind("ajax:error", (event, xhr, settings, exceptions) ->
    error_messages = if xhr.responseJSON['error']
      "<div class='alert alert-danger pull-left'>" + xhr.responseJSON['error'] + "</div>"
    else if xhr.responseJSON['errors']
      $.map(xhr.responseJSON["errors"], (v, k) ->
        "<div class='alert alert-danger pull-left'>" + k + " " + v + "</div>"
      ).join ""
    else
      "<div class='alert alert-danger pull-left'>Unknown error</div>"
    $(this).parents('.modal').children('.modal-footer').html(error_messages)
  )