module ApplicationHelper


# Helper methods for Devise. Those methods are needed to create our own views and use them in modal windows.
  def resource_name
    :user
  end

  def resource
   @resource ||= User.new
  end

  def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
  end
# End of devise helpers.




# Draw all topucomments cards with associated companies
  def helper_draw_cards(comments)
    out_html=''
    comments.each do |comment|
    each_html = <<-HTML
      <br>
      <div class="main-page-comment-company">
          #{ helper_draw_comment_card(comment) }
          #{ helper_draw_company_card(comment.company) }
      </div>
      HTML
    out_html << each_html
    end
    out_html.html_safe
  end

  # Draw topucomment card
  def helper_draw_comment_card(comment)
    html = <<-HTML
      <div class="comment-main">
        <div class="comment-user-logo">
          #{image_tag(comment.user.avatar.url(:thumb))}
        </div>
        <div class="comment-body #{comment.positive ? 'comment-positive' : 'comment-negative'}" >
        <div class="comment-title">
          #{comment.title}
        </div>
        <div class="comment-rating">
        #{ helper_draw_stars_for_commment(comment) }

        </div>
        <div class="comment-text">
        #{comment.body}
        </div>
        <div align="center" class="comment-buttons">
            #{ helper_draw_favorite_button(comment) }
            #{ helper_draw_like_dislike(comment) }
            #{ helper_draw_share_button(comment) }
        </div>
          <div class="comment-user-info">

            #{ link_to(comment.user.name, user_path(comment.user.id))}
            &nbsp;&nbsp;&nbsp;&nbsp;
            #{ comment.created_at.strftime("%b %d, %Y %H:%M") }
            #{ link_to 'Подробнее', ucomment_path(comment), class: 'btn btn-primary btn-for-comment-details' }
          </div>
        </div>
      </div>
    HTML
    html.html_safe
  end

  #Draw Company Card
  def helper_draw_company_card(company)
    html = <<-HTML
      <div class="company-card">
        <div class="company-card-upper">
          <div class="company-card-positive">
            <div class="company-card-like">
              <span>#{ company.total_positive }</span>
            </div>
            <div class="company-card-dislike">
              <span>#{ company.total_negative }</span>
            </div>
          </div>
          <div class="company-card-votes">
          </div>
        </div>
        <div>
          <div class="company-card-image">
            #{ image_tag company.image.url(:thumb) }
          </div>
          <div class="company-card-info">
            <b>#{ link_to company.category.title, categories_path(company.category.id) }</br>
            #{ company.phones.split(';')*", " }<br/>
            #{ company.address }<br/>
            #{ link_to company.email }
          </div>
        </div>
        <div class="company-card-bottom">
          <span class="mini_card_company_title">#{ link_to company.title.upcase, company_path(company) }</span>
          <span class="mini_card_company_review">#{ link_to "Все отзывы", company_review_path(company) }</span>
        </div>
      </div>
    HTML
    html.html_safe
  end

# Draw Like/Dislike button with numbers
  def helper_draw_like_dislike(comment)
    css_active_like_class = 'vote-active'
    css_active_dislike_class = 'vote-active'

    div_id_like_prefix = 'like_'
    div_id_dislike_prefix = 'dislike_'
    btn_prefix = 'btn_'
    id = comment.id.to_s

    if current_user
      voted = comment.get_vote_of_user(current_user)
      css_active_like_class = (voted == :like ? 'vote-active' : 'vote-inactive')
      css_active_dislike_class = (voted == :dislike ? 'vote-active' : 'vote-inactive')
    end

    content_tag :div, id: 'vote_' + id , style: 'margin-top:10px' do
      # LIKE
      concat( content_tag(:div, id: div_id_like_prefix + id, class: ['vote-message', 'vote-up-text']) do
        concat(comment.count_votes(:like))
      end )

      concat( image_tag('/images/up.png',
                        id: btn_prefix + div_id_like_prefix + id,
                        'data-id' => id,
                        'data-execute' => 'like',
                        class: ['vote-buttons', css_active_like_class ],
                        alt: 'Нравится'))

      # DISLIKE
      concat( image_tag('/images/down.png',
                        id: btn_prefix + div_id_dislike_prefix + id,
                        'data-id' => id,
                        'data-execute' => 'dislike',
                        class: ['vote-buttons', css_active_dislike_class],
                        alt: 'Не нравится'))

      concat( content_tag(:div, id: div_id_dislike_prefix + id, class: ['vote-message', 'vote-down-text']) do
        concat (comment.count_votes(:dislike))
      end )
    end
  end


  def helper_draw_share_button(comment)
    content_tag :div, class: 'share-div' do
      concat( image_tag(  '/images/share.png',
                          'data-id' => comment.id.to_s,
                          'data-title' => comment.title,
                          class: 'share-button',
                          alt: 'Поделиться'))
    end
  end

  def helper_draw_favorite_button(comment)
    return unless current_user
    id = comment.id.to_s
    result = current_user.is_in_favorite(comment)
    img_favorite = (result == :added) ? '/images/favorite.png' : '/images/favorite-empty.png'
    p_onclick = 'FavoritesAdd('+ id + ');'
    content_tag :div, class: 'favorite-div' do
      concat( image_tag(  img_favorite,
                          'id' => 'favorite_' + id,
                          'data-id' => id,
                          onclick: p_onclick,
                          class: 'favorite-button',
                          alt: 'В избранное'))
    end
  end

# Draw Categories in SIDE MENU
  def helper_draw_categories(categories)
    html = ''
    categories.each do |category|
      if category.subcategories.present?
        each_html = <<-HTML
                    <li class="dropdown">
                      <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                        #{ category.title }<b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu navmenu-nav" role="menu">
                        #{ helper_draw_subcategories(category) }
                      </ul>
                    </li>
        HTML
        html << each_html
      end
    end
    html.html_safe
  end

# Draw SUBCATEGORIES in SIDE MENU
  def helper_draw_subcategories(category)
    html=''
    category.subcategories.each do |subcategory|
      each_html = content_tag :li do
        link_to subcategory.title, categories_path(subcategory.id)
      end
      html << each_html
    end
    html.html_safe
  end

  def helper_draw_stars_for_commment(comment)
    value = comment.rate
    html = ''
    for i in 1..5
      if i<= value
        html << '<img src="/images/star-full.png" class="main-stars"/>'
      else
        html << '<img src="/images/star-empty.png" class="main-stars"/>'
      end
    end
    html.html_safe
  end

end

