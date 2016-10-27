class UcommentsController < ApplicationController
  def show
    @comment = Ucomment.find(params[:id])
  end

  def create
    @comment = Ucomment.new(comment_params)
    if @comment.save
      redirect_to  root_url
    else
      render 'new'
    end
  end

  def new
    @comment = Ucomment.new
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:ucomment).permit(:title, :body, :positive, :rate, :user_id, :company_id)
  end
end
