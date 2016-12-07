$(document).ready(function(){

    // First Step NEGATIVE/POSITIVE
    $(document).on('click', '.positive-negative-select', function(event){
        event.stopPropagation();
        $("#company_name_div").show();
    });

    company_search = $("#company_name");
    company_name_div =$('#company_name_div');
    search_result_box = $("#search_result_box");
    search_content = $("#search_content");
    search_status = $("#search_status")

    company_search.keyup(function(e) {
        e.stopPropagation();
        clearTimeout($.data(this, 'timer'));
        if ( company_search.val().length > 1)
            $(this).data('timer', setTimeout(search(company_name_div, this), 1000));
        else
            search_result_box.hide();
    });

    function search(input_obj, obj) {
        clearTimeout($.data(obj, 'timer'));
        var existingString = company_search.val();
        search_result_box.show();
        search_result_box.css( {    position:"absolute",
                                    top: input_obj.offset().top + input_obj.outerHeight() ,
                                    left: input_obj.offset().left,
                                    'height' : '200px',
                                    'max-height': '200px',
                                    'min-width' : input_obj.innerWidth()} );

        search_content.html('<img id="search_image" class="search-image" src="/images/loading.gif"/>');
        search_status.css( 'text-align', 'center');
        search_status.html('<span class="search-status-msg">Выполняется поиск компании...</span>');

        $.get('/search/new' , {
            company: company_search.val()
        }, null);
    }

    $(document).on('click', '.company-item', function(){
        alert($(this).attr('data-id'));
    });




});

