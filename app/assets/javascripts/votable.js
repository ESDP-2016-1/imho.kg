$(document).on('click', '.vote-buttons', function(){
    $.post("/vote",
        {
            comment_id: $(this).attr('data-id'),
            execute: $(this).attr('data-execute')
        },
        function(){ });
});
