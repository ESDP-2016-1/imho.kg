class ModerationController < ApplicationController
  before_action :authenticate_user!

  def verify_comment
    params = moderation_params
    if current_user.id.to_s == params[:user_id]
      # TODO: method Allow / Deny(if new Company created)
      # TODO: redirections on following conditions
      @item = Moderation.new(moderation_params)
      # binding.pry
    end


  end



  private

  def moderation_params
    params.require(:add).permit(:user_id, :company_id, :comment_title, :comment_body, :comment_anonymous, :comment_rate, :image1, :image2, :image3, :image4, :image5)
  end

  # TODO: permit_params for CreateCompany

end