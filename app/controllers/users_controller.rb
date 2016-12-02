class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show_foreign

  def show
    @user = User.find(current_user.id)
    @variables = {
        :positive_comment => @user.ucomments.where(:positive => true),
        :negative_comment => @user.ucomments.where(:positive => false)}
  end

  def show_foreign
    if current_user && (current_user.id == params[:id].to_i)
      redirect_to(profile_path)
    else
      @user = User.find(params[:id])
      @variables = {
          :positive_comment => @user.ucomments.where(:positive => true),
          :negative_comment => @user.ucomments.where(:positive => false)}
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


  def destroy
  end

  private 

  def user_update_params
    params.require(:user).permit(:fullname, :name, :dob, :city_id, :gender_id)
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
