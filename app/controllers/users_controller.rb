class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show_foreign

  def show
    @user = User.find(current_user.id)
  end

  def show_foreign
    @user = User.find(params[:id])
    render 'show'
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    user = User.find_by_email(params[:user][:email])
    if user.valid_password?(params[:user][:current_password])
      params[:user].delete(:current_password)
    end

    if @user.update(user_params)
      flash[:success] = "You've updated your profile."
      redirect_to root_path
    else
      flash[:error] = "Something went wrong, please, try again."
      render 'edit'
    end  

  end

  def destroy
  end

  private 

  def user_params
    params.require(:user).permit(:fullname, :name, :email, :password, :password_confirmation, :current_password, :dob, :avatar, :gender_id, :city_id, :role_id )
  end

end
