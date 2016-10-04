class PagesController < ApplicationController
  
  def index
    @users = User.all
    @cats = Category.all
  end

end
