class MainController < ApplicationController
  
  def index
    @comments = Ucomment.where(topucomment_id: nil)
    @negative_total_count = Ucomment.where(topucomment_id: nil, positive: false).count
    @positive_total_count = Ucomment.where(topucomment_id: nil, positive: true).count
  end

  def categories
  	@companies = Company.where(category_id: params[:id])
  end

  def ajax_get_negative_comments
  	@comments = Ucomment.where(topucomment_id: nil, positive: false)
  end

  def ajax_get_positive_comments
  	@comments = Ucomment.where(topucomment_id: nil, positive: true)
  end

  private

end