class MainController < ApplicationController
  
  def index
    @comments = Ucomment.where(topucomment_id: nil)

    @data = { positive_total_count: 0 ,
              negative_total_count: 0 }
    @comments.map {|comment| comment.positive ? @data[:positive_total_count]+=1 : @data[:negative_total_count]+=1 }
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
