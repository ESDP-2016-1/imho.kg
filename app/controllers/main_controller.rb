class MainController < ApplicationController
  before_filter :authenticate_user!, :only => [:ajax_vote_for]

  def index
    @comments = Ucomment.for_view_state( sort_by_in_session, params[:page], show_state_in_session )

    @data = { positive_total_count: count_total_positive,
              negative_total_count: count_total_negative,
              modal: get_modal_from_session }

    erase_modal_in_session
  end


  def categories
  	@companies = Company.where(category_id: params[:id]).paginate(page:params[:page])
  end


  def negative_comments
    session[:show_state] == "negative" ? session.delete(:show_state) : session[:show_state] = "negative"
    redirect_to root_path
  end


  def positive_comments
    session[:show_state] == "positive" ? session.delete(:show_state) : session[:show_state] = "positive"
    redirect_to root_path
  end

  def sorting
    apply_sort_by
    redirect_to root_path
  end

  def ajax_vote_for
    comment = get_comment_from_params
    return unless comment

    like_dislike = params[:execute].parameterize.to_sym
    result = Vote.add(current_user, comment, like_dislike)
    @data = { id:       comment.id,
              likes:    comment.count_votes(:like),
              dislikes: comment.count_votes(:dislike),
              voted:    result
    }
  end

  def ajax_favorites
    comment = get_comment_from_params
    return unless comment

    @data = { id: comment.id.to_s,
              result: current_user.add_to_favorites(comment) }
  end



  private

  # CHECK FOR AJAX CURRENT_USER AVAILABLE OR NOT
  def get_comment_from_params
    return unless current_user
    comment = Ucomment.find(params[:comment_id])
  end

  # GETING MODAL WINDOW NAME TO SHOW FROM SESSION
  def get_modal_from_session
    return nil unless session[:modal]
    session[:modal]
  end

  # ERASE MODAL WINDOW NAME IN SESSION
  def erase_modal_in_session
    session.delete(:modal)
  end

  # SETTING SESSION[:sorting] DEPENDS OF PARAMS[:type]
  def apply_sort_by
    case params[:type]
      when 'most_disputed'
        session[:sorting]='most_disputed'
      when 'most_rated'
        session[:sorting]='most_rated'
      else
        session.delete(:sorting)
    end
  end

  # GETTING SORTING BY TYPE FOR COMMENTS FROM SESSION
  def sort_by_in_session
    case session[:sorting]
      when 'most_disputed'
        'created_at ASC'
      when 'most_rated'
        'created_at DESC'
      else
        'created_at DESC'
    end
  end

  # GETTING SELECT*WHERE FOR COMMENTS IF SPECIFIED SHOW_STATE PRESENT
  def show_state_in_session
    case session[:show_state]
      when 'positive'
        { topucomment_id: nil, deleted: false, positive: true }
      when 'negative'
        { topucomment_id: nil, deleted: false, positive: false }
      else
        nil
    end
  end

  # RETURN TOTAL OF POSITIVE COMMENTS
  def count_total_positive
    Ucomment.count_total_positive
  end

  # RETURN TOTAL OF NEGATIVE COMMENTS
  def count_total_negative
    Ucomment.count_total_negative
  end

end
