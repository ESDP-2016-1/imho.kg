# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

    $(document).on('ready', function() {
        $("#create_answer_to_comment").on('click', function(event) {

            $.ajax({
                type: "GET",
                url: '/new_reply',
                data: {}
            })
        });
    });