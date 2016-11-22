class UcommentsController < ApplicationController

  def new
    @comment = Ucomment.new
  end

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

  def edit
    @comment = Ucomment.find(params[:id])

    if @comment.topucomment_id.nil?
      render partial: 'form'
    else 
      @parentcomment = Ucomment.find(@comment.topucomment_id)
      render partial: 'reply', :locals => {ucomment: @comment, parentcomment: @parentcomment}
    end
  end 

  def new_reply
   @parentcomment = Ucomment.find(params[:ucomment])
   @reply = Ucomment.new

   respond_to do |format|
    format.js {}
   end
  end


  def update
    @comment = Ucomment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to_comment
    else
      render 'edit'
    end

  end

  def destroy
    @comment = Ucomment.find(params[:ucomment])
    if @comment.topucomment_id.nil?
      destroy_topucomment_and_its_childs(@comment)
      @comment.body = "Комментарий был удален"
      @comment.save
      redirect_to root_path
    else
      
      @comment.body = "Комментарий был удален"
      @comment.save
      
      redirect_to :back
    end  
  end

  private

  def redirect_to_comment
    main_comment = @comment.topucomment_id.nil?
    if main_comment
        redirect_to @comment
      else
        case params[:action]
          when 'create'
            redirect_to :back
          when 'update'
            current_comment = @comment
            while current_comment.topucomment_id != nil
              current_comment = current_comment.topucomment
            end  
            redirect_to ucomment_path(current_comment)
        end    
      end
  end

  def destroy_topucomment_and_its_childs(comment)
      if comment.subucomments.present?
        for subcomment in comment.subucomments do
          subcomment.body = "Комментарий был удален"
          subcomment.save
          destroy_topucomment_and_its_childs(subcomment)
        end  
      else
        comment.body = "Комментарий был удален"
        comment.save  
      end
  end  

  def comment_params
    params.require(:ucomment).permit(:title, :body,
                   :positive, :rate, :topucomment_id, :user_id, :company_id)
  end

end
