module ApplicationHelper


# Helper methods for Devise. Those methods are needed to create our own views and use them in modal windows.
  def user_resource_name
    :user
  end

  def user_resource
   @resource ||= User.new
  end

  def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
  end
# End of devise helpers.

  
  def helper_get_all_categories
    @categories = Category.all
  end

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
      #{link_to 'Подробнее', ucomment_path(comment), class: 'btn btn-primary'}
    </div>
  </div>
</div>
HTML
    html.html_safe
  end

  def helper_draw_company_card(company)
    html = <<-HTML
<div class="company-card">
  <div class="company-card-upper">
    <div class="company-card-positive">
      <div class="company-card-like">
        <span>#{company.ucomments.where(topucomment_id: nil, positive: true).count }</span>
      </div>
      <div class="company-card-dislike">
        <span>#{company.ucomments.where(topucomment_id: nil, positive: false).count }</span>
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
    <span class="mini_card_company_review">#{ link_to "Все отзывы" }</span>
  </div>
</div>
    HTML
    html.html_safe
  end


end

