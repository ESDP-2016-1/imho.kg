class UcommentsController < ApplicationController

  def show
    @comment = Ucomment.find(params[:id])
  end

  def create
    @comment = Ucomment.new(comment_params)
    comment_saved = @comment.save
    if comment_saved
      redirect_to_comment
    else
      render 'new'
    end
  end

  def redirect_to_comment
    main_comment = @comment.topucomment_id.nil?
    if main_comment
        redirect_to @comment
      else
        redirect_to :back
      end
  end

  def new_reply
   @parentcomment = Ucomment.find(params[:ucomment])
   @reply = Ucomment.new

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
    @comment = Ucomment.find(params[:ucomment])
    if @comment.topucomment_id.nil?
      while @comment.subucomments.present?
        for subcomment in @comment.subucomments do
          destroy_topucomment_and_its_childs(subcomment)
        end  
      end
      @comment.destroy
      redirect_to root_path
    else
      
      @comment.body = "Комментарий был удален"
      @comment.save
      binding.pry
      redirect_to :back
    end  
  end

  private

  def destroy_topucomment_and_its_childs(comment)
      if comment.subucomments.present?
        comment.subucomments.each do |subucomment|
          destroy_topucomment_and_its_childs(subucomment)
        end  
      else
        comment.destroy
      end  
  end  

  def comment_params
    params.require(:ucomment).permit(:title, :body,
                   :positive, :rate, :topucomment_id, :user_id, :company_id)
  end

end
