$(document).on('ready', function() {
	function disableSubcategorySelect() {
		$("#sub_category_id").attr('disabled', 'disabled');
	};
	function enableSubcategorySelect() {
		$("#sub_category_id").removeAttr('disabled');
	};

	var topcategory_id_value = $('#top_category_id').val();
	if (topcategory_id_value === '') {
		disableSubcategorySelect();
	}

	$('#top_category_id').on('change', function(event){
		var topcategory_id_value = $('#top_category_id').val();
		if (topcategory_id_value !== '') {
			enableSubcategorySelect();
		}
		else {
			disableSubcategorySelect();
		}
		$.ajax({
			type: "GET",
			url: '/upd_subcategories',
			data: {topcategory_id: topcategory_id_value},
			success: function(data) {
				var renderedOptions = data.map(function(subCategory) {
					return '<option value="' + subCategory.id + '">' + subCategory.title + '</option>';
				})
				$('#sub_category_id').html(renderedOptions);
			}
		});
		
	});
});