$(document).on('ready', function() {
	
	$("#comments_container").on('click', "#subcomment_close_btn", function() {
		$("#ajax_new_reply_to_comment").remove();
		
			CKEDITOR.instances['ckeditor'].updateElement();
            CKEDITOR.instances['ckeditor'].setData('');
		
	});

	$("#comments_container").on('click', "#edit-comment-btn", function() {
		$('form-horizontal').find('.ckeditor').ckeditor();
	});
	$('form-horizontal').find('.ckeditor').ckeditor();
});