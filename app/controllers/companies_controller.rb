class CompaniesController < ApplicationController

  def show
  	@company = Company.find(params[:id])
  end

  def edit
  	@company = Company.find(params[:id])
  end
  
  def update_subcategories
  	@categories = Category.where("topcategory_id = ?", params[:topcategory_id])
  	respond_to do |format|
  		format.js {}
  	end	
  end
end
