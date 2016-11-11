class UcommentsController < ApplicationController

  def show
    @comment = Ucomment.find(params[:id])
  end

  def create
    @comment = Ucomment.new(comment_params)
    if @comment.save
      if @comment.topucomment_id.nil?
        redirect_to @comment
      else
        redirect_to :back
      end
    else
      render 'new'
    end
  end

  def new_reply
   @parentcomment = Ucomment.find(params[:ucomment])
   @ucomment = Ucomment.new

   respond_to do |format|
    format.js {}
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
    params.require(:ucomment).permit(:title, :body,
                   :positive, :rate, :topucomment_id, :user_id, :company_id)
  end

end
