class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else
      render 'new'
    end
  end

  def show
  	@company = Company.find(params[:id])
  end

  def edit
  	@company = Company.find(params[:id])
  end

  def update
  	@company = Company.find(params[:id])
  	if @company.update(company_params)
  		flash[:success] = "Company was successfully updated!"
  		redirect_to company_path
  	else
  		flash[:danger] = "There is an issue with updating the company"
  		render 'edit'
  	end
  end
  
  def update_subcategories
  	@subcategories = Category.where(topcategory_id: params[:topcategory_id])
    respond_to do |format|
      format.json { render json: @subcategories.to_json(:only => [:id, :title]) }
    end  
  end

  private 

  def company_params
  	params.require(:company).permit(
  		:title, :registration_year, :category_id, :city_id, 
  		:address, :phones, :working_hours, :email, :website)
  end
end
