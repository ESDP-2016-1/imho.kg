$(document).on('ready', function() {
	
	$("#comments_container").on('click', "#subcomment_close_btn", function() {
		$("#ajax_new_reply_to_comment").remove();
				
	});

	$(function () {
  		$('[data-toggle="tooltip"]').tooltip()
	});

	$("#comments_container").on('click', "#update_comment_btn", function() {
		/*$("#ajax_new_reply_to_comment").remove();*/
	});
		
});


