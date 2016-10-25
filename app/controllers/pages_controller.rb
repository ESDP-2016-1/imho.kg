class PagesController < ApplicationController
  
  def index
    @users = User.all
    @companies = Company.all
    @comments = Ucomment.all
  end

end
