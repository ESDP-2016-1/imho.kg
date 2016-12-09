class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show_foreign

  def show
    @user = User.find(current_user.id)
    variables_for_views
  end

  def show_foreign
    if current_user && (current_user.id == params[:id].to_i)
      redirect_to(profile_path)
    else
      @user = User.find(params[:id])
      variables_for_views
      render 'show'
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
      @user = User.find(current_user.id)
      if @user.apply_updates(user_update_params, current_user.valid_password?(params[:user][:password]))
        redirect_to profile_path
      else
        render 'edit'
      end
  end

  def favorite_comments
    @user = User.find(current_user.id)
    @comments = []
    @user.favorites.each do |favorite|
      @comments << Ucomment.where(:id => favorite.ucomment_id)
    end
  end


  def destroy
  end

  private 

  def user_update_params
    params.require(:user).permit(:fullname, :name, :dob, :city_id, :gender_id)
  end

  def variables_for_views
      @variables = {
        :positive_comment => Ucomment.where(:positive => true, :topucomment_id => nil, :user_id => @user.id),
        :negative_comment => Ucomment.where(:positive => false, :topucomment_id => nil, :user_id => @user.id),
        :user_activity => Ucomment.where(:user_id => @user.id, :topucomment_id => nil)}
  end
=begin
  def validate_before_update
    flash[:error] ||= []
    flash[:error] << "Пароль не соответствует\n" unless @user.valid_password?(params[:user][:current_password])
    flash[:error] << "Длинна имени не должна быть больше 50 символов\n" if params[:user][:name].length > 50
    flash[:error] <<  "Длинна имени не может быть менее 4 символов\n" if params[:user][:name].length < 4
  end
=end

end
