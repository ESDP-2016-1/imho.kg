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

 def create_answer
    @parentcomment = Ucomment.find(:id)
    @ucomment = Ucomment.create(params[:comment => {ucomment_id: @parentcomment.id}])
    if @ucomment.save
        respond_to do |format|

          format.js {}
      end
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

  def comment_answer_params
    params.require(:ucomment).permit(:body, :user_id, :company_id, :topucomment_id)
  end
end
