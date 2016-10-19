class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])

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
    params.require(:user).permit(:fullname, :name, :email, :password, :password_confirmation, :dob, :avatar, :gender_id, :city_id, :role_id )
  end
end
