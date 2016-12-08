image_full = "/images/star-full.png";
image_half = "/images/star-half.png";
image_empty = "/images/star-empty.png";

    function DrawStars(div_block, amount, value, prefix_id, callback, class_for_star) {
        var html_stars = $('<div>');

        value = parseFloat(value);
        div_block = div_block.selector ? div_block : $(div_block);

        div_block.empty();
        for (var i = 1; i <= amount; i++) {
            if (value == 0) {
                html_stars.append(CreateImg(i, prefix_id, image_empty, class_for_star));
                continue;
            }
            if ((i <= value)) {
                html_stars.append(CreateImg(i, prefix_id, image_full, class_for_star));
            }
            else {
                if ((Math.ceil(value)==i) && ((i - value)>0)) {
                    html_stars.append(CreateImg(i, prefix_id, image_half, class_for_star));
                    continue;
                }
                html_stars.append(CreateImg(i, prefix_id, image_empty, class_for_star));
            }

        }
        div_block.append(html_stars);
    }

    function CreateImg(id, preffix, image, class_selector) {
        var tag = '<img id="' + preffix.toString() + id.toString() + '" src="' + image +
                '" class="' + class_selector +
                '" data-id="' +
                id.toString() +'">';
        return tag;
    }

    function ReDrawStarsOnClick(div_block , class_selector, clicked_id) {
        div_block = div_block.selector ? div_block : $(div_block);

        var star_elements = div_block.find("."+class_selector);
        for(var i=0; i <= star_elements.length; i++ ) {
            var selected_img = $(star_elements[i]);
            if (selected_img.attr('data-id') > clicked_id) {
                selected_img.attr('src', image_empty)
            }
            else  {
                selected_img.attr('src', image_full)
            }
        }
    }