close_button_image = "/images/close-image-btn.png";
//preffix_of_hidden_fields = '#image_select_';
default_image_path = '';

function AddImageBlock(div_block, amount, default_image){
    div_block = div_block.selector ? div_block : $(div_block);
    div_block.empty();
    default_image_path = default_image;
    for(var i=1; i<=amount; i++) {
        div_block.append(DrawSelectImage(default_image, i));
        div_block.find('.class-close-image').hide();
    }
}

function DrawSelectImage(image, id){
    var html = '<div class="class-image-container">' +
                    '<img class="class-image" src="'+ image + '" data-id="'+ id.toString() +'"/>' +
                    '<img class="class-close-image" data-id="'+ id.toString()+'" src="' + close_button_image +'"/>' +
               '</div>';
    return html;
}

function readURL(input, img) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            img.attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}

$(document).ready( function() {

    $(document).on('click', '.class-image', function () {
        var id = $(this).attr('data-id');
        var result = $("#hidden_form > input[data-id='" + id +"']").click();
    });

    $(document).on('click', '.class-close-image', function(){
        var id=$(this).attr('data-id');
        var image_field = $(this).siblings('.class-image');
        $(this).hide();
        image_field.attr('src', default_image_path);
        $("#hidden_form > input[data-id='" + id + "']").val('');
    });

    $('input[type=file]').change(function(e){
        var id=$(this).attr('data-id');
        var image_field = $(".class-image-container > .class-image[data-id=" + id + "]");
        readURL(this, image_field);
        image_field.siblings('.class-close-image').show();

    });
});
