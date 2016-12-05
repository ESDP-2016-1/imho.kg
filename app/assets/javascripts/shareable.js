
$(document).ready(function(){
    share_popup = $("#share_popup");
    share_popup.hide();

    $(document).on('click', '.share-button', function(event) {
        event.stopPropagation();
        var facebook_share = 'https://www.facebook.com/sharer/sharer.php?u=app.kg',
            twitter_share = 'https://twitter.com/home?status=app.kg',
            google_share = 'https://plus.google.com/share?url=app.kg',
            linkedin_share = 'https://www.linkedin.com/shareArticle?mini=true&url=app.kg&title=Title&summary=asdfasdf&source=asdfsd.sss',
            pinterest_share = 'https://pinterest.com/pin/create/button/?url=pin.png&media=image.png&description=';

        share_popup.show();
        share_popup.css( { position:"absolute", top: $(this).offset().top, left: $(this).offset().left } );
        share_popup.empty();

        share_popup.append($('<img>',{
            'onclick' : "window.open('"+ facebook_share + $(this).attr('data-id')+ "','name','width=600,height=400')",
            'src' : "/images/share_facebook.png",
            'alt' : "Поделиться в Facebook",
            'title': "Поделиться в Facebook",
            'class' : "share-button-item"}));

        share_popup.append($('<img>',{
            'onclick' : "window.open('" + twitter_share + $(this).attr('data-id') + "','name','width=600,height=400')",
            'src' : "/images/share_twitter.png",
            'alt' : "Поделиться в Twitter",
            'title': "Поделиться в Twitter",
            'class' : "share-button-item"}));

        share_popup.append($('<img>',{
            'onclick' : "window.open('" + google_share + $(this).attr('data-id') + "','name','width=600,height=400')",
            'src' : "/images/share_google.png",
            'alt' : "Поделиться в Google+",
            'title': "Поделиться в Google+",
            'class' : "share-button-item"}));

    });

    $(document).click(function(event){
        if (!($(event.target).is("#share_popup") || $(event.target).parents().is("#share_popup"))) share_popup.hide();
    });

});
