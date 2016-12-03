class MainController < ApplicationController


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



  private


  # GETING MODAL WINDOW NAME TO SHOW FROM SESSION
  def get_modal_from_session
    return nil unless session[:modal]
    session[:modal]
  end

  # ERASE MODAL WINDOW NAME IN SESSION
  def erase_modal_in_session
    session.delete(:modal)
  end

  # GETTING SORTING BY TYPE FOR COMMENTS FROM SESSION
  def sort_by_in_session
    case session[:sorting]
      when 'date'
        'created_at'
      else
        'created_at'
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
