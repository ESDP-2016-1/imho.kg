class MainController < ApplicationController
  
  def index
    @comments = Ucomment.where(topucomment_id: nil, deleted: false).paginate(:page => params[:page])

    @data = { positive_total_count: count_total_positive,
              negative_total_count: count_total_negative,
              modal: get_modal_from_session }

    erase_modal_in_session
  end

  def categories
  	@companies = Company.where(category_id: params[:id])
  end

  # AJAX

  def ajax_get_negative_comments
  	@comments = Ucomment.where(topucomment_id: nil, positive: false, deleted: false)
  end

  def ajax_get_positive_comments
  	@comments = Ucomment.where(topucomment_id: nil, positive: true, deleted: false)
  end





  private

  def get_modal_from_session
    return nil unless session[:modal]
    session[:modal]
  end

  def erase_modal_in_session
    session.delete(:modal)
  end

  def count_total_positive
    Ucomment.where(topucomment_id: nil, positive: true, deleted: false).count
  end

  def count_total_negative
    Ucomment.where(topucomment_id: nil, positive: false, deleted: false).count
  end


end
