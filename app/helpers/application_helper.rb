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
        #{comment.rate}
        #{comment.positive}
            #{comment.topucomment.title unless comment.topucomment_id.nil? }
        </div>
        <div class="comment-text">
        #{comment.body}
        </div>
        <div class="comment-buttons">
        </div>
          <div class="comment-user-info">

            #{link_to(comment.user.name, user_path(comment.user.id))}
            &nbsp;&nbsp;&nbsp;&nbsp;
            #{comment.created_at.strftime("%b %d, %Y %H:%M")}
            #{link_to 'Подробнее', ucomment_path(comment), class: 'btn btn-primary btn-for-comment-details'}
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
            #{image_tag company.image.url(:thumb)}
          </div>
          <div class="company-card-info">
            <b>#{ company.category.title }</b>
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



end

