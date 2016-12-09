$(document).ready(function(){
    hidden_form = $("#hidden_form");
    hidden_form.hide();

    company_search = $("#company_name");
    company_search.prop('disabled', false);

    stars_div = $("#stars_show");
    company_card = $("#company_card_show");

    input_block = $("#input_block");
    images_block = $("#images_block");

    company_name_div =$('#company_name_div');
    search_result_box = $("#search_result_box");
    search_content = $("#search_content");
    search_status = $("#search_status");

    // First Step NEGATIVE/POSITIVE
    $(document).on('click', '.positive-negative-select', function(event){
        event.stopPropagation();
        $("#company_name_div").show();
    });



    company_search.keyup(function(e) {
        e.stopPropagation();

        //# TODO disable system keys like ESC and SHIFT
        //# TODO window resize
        stars_div.hide();
        company_card.hide();
        input_block.hide();

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

    $(document).on('click','#add_new', function(){
        search_content.empty();
        search_status.empty();

        search_content.html(  '<div class="div-space"></div>' +
                                '<div class="add-company-item">' +
                                    '<div class="add-company-field-desc">Название:</div>' +
                                    '<div class="add-company-field"><input name="occupation" type="text"></div>' +
                                '</div>' +
                                '<div class="add-company-item">' +
                                    '<div class="add-company-field-desc">Вид деятельности:</div>' +
                                    '<div class="add-company-field"><input name="occupation" type="text"></div>' +
                                '</div>' +
                                '<div class="add-company-item">' +
                                    '<div class="add-company-field-desc">Адрес:</div>' +
                                    '<div class="add-company-field"><input name="address" type="text"></div>' +
                                    '</div>' +
                                '</div>' +
                                '<div class="add-company-item">' +
                                    '<div class="add-company-field-desc">Телефоны:</div>' +
                                    '<div class="add-company-field"><input name="phones" type="text"></div>' +
                                '</div>'
                                );

        search_status.html( '<div class="add-company-back-btn"><img src="/images/add-company-back-btn.png"></div>' +
                            '<div id="add_create" data-type="create"><span class="search-status-msg">Добавить эту компанию...</span></div>');

        var company_name = $('.add-company-field').first().find('input:first');
        company_name.val(company_search.val());
        company_name.select();

    });

    $(document).on('click', '.add-company-back-btn', function(e) {
        e.stopPropagation();
        search(company_name_div, company_search);
        company_search.focus();
    });

    $(document).on('click', '#add_create', function(e){
        e.stopPropagation();
        alert('salam');
    });

    $(document).on('click', '.company-item', function(){
        search_result_box.hide(400);
        $.ajax({
            url: '/search/show',
            data: { company_id : $(this).attr('data-id') },
            success: function(company_card_html){
                company_card.show();
                company_card.html(company_card_html);
            },
            dataType: 'html'
        });
        stars_div.show();
        DrawStars(stars_div, 5, 0, 'stars_', null, 'star-img' );
        //company_search.prop('disabled', true);
    });


    //STARS
    $(document).on('click', '.star-img', function(e){
       var id = $(this).attr('data-id');
        ReDrawStarsOnClick('#stars_show', 'star-img', id);
        input_block.show();
        images_block.empty();
        AddImageBlock(images_block, 5,'/images/add-image.png');
    });

});

