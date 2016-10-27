$(document).on('ready', function() {
	console.log('ready');
	$('#company_topcategory_id').on('change', function(event){
		$.get(
			'upd_subcategories',
			{topcategory_id: $('#company_topcategory_id option:selected').val()}
		); 
	});
});