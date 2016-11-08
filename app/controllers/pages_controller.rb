class PagesController < ApplicationController
  
  def index
    @companies = Company.all

  end

  def show
  	@selected_companies = Company.where(category_id: params[:id])
  end

  def show_negative
  	@all_negative_reviews = Ucomment.where(topucomment_id: nil, positive: false)
  	
  	respond_to do |format|
  		format.js {}
  	end	

  end

  def show_positive
  	@all_positive_reviews = Ucomment.where(topucomment_id: nil, positive: true)

  	respond_to do |format|
      format.js {}
    end  
  	
  end


end
