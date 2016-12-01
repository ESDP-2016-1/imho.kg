$(document).on('ready', function() {
	
	$("#comments_container").on('click', "#subcomment_close_btn", function() {
		$("#ajax_new_reply_to_comment").remove();
	});

});