class UcommentsController < ApplicationController

  def new
    @comment = Ucomment.new
  end

  def show
    @comment = Ucomment.find(params[:id])
    @all_subcomments = Array.new
    @total_subcomments = count_all_subcomments(@comment)
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
      destroy_all_children_of_topucomment(@comment)
      @comment.deleted = true
      @comment.save
      redirect_to root_path
    else
      
      @comment.deleted = true
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

  def destroy_all_children_of_topucomment(comment)
      if comment.subucomments.present?
        for subcomment in comment.subucomments do
          subcomment.deleted = true
          subcomment.save
          destroy_all_children_of_topucomment(subcomment)
        end  
      else
        comment.deleted = true
        comment.save  
      end
  end  

  def count_all_subcomments(comment)  
    if comment.subucomments.present?
      for subcomment in comment.subucomments do
        #unless subcomment.deleted
          @all_subcomments.push subcomment
        #end  
        count_all_subcomments(subcomment)
      end
    end
    return @all_subcomments.size

  end

  def comment_params
    params.require(:ucomment).permit(:title, :body,
                   :positive, :anonymous, :rate, :topucomment_id, 
                   :user_id, :company_id, :deleted)
  end

end
