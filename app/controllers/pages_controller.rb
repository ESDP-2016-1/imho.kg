class PagesController < ApplicationController
  
  def index
    @companies = Company.all

  end

  def show
  	@selected_companies = Company.where(category_id: params[:id])
  end


end
