class CompaniesController < ApplicationController

  def show
  	@company = Company.find(params[:id])
  end

  def edit
  	@company = Company.find(params[:id])
  end
  
end
