class UcommentsController < ApplicationController
  include UcommentsHelper

  def new
    @comment = Ucomment.new
  end

  def show
    @comment = Ucomment.find(params[:id])
    all_subcomments = Array.new
    @total_subcomments = helper_count_all_subcomments(@comment, all_subcomments)
  end

  def create
    @comment = Ucomment.new(comment_params)
    if @comment.save
      helper_redirect_to_comment
    else
      render 'new'
    end
  end

  def edit
    @comment = Ucomment.find(params[:id])
    if !@comment.topucomment_id.nil?
      @parentcomment = Ucomment.find(@comment.topucomment_id)
    end

    respond_to do |format|
        format.js {render 'ajax_edit_comment.js.erb', locals: {ucomment: @comment, parentcomment: @parentcomment}}
      end
  end 

  def new_reply
   @parentcomment = Ucomment.find(params[:ucomment])
   @reply = Ucomment.new
   
   respond_to do |format|
    format.html
    format.js { render 'ajax_new_reply_to_comment.js.erb', locals: {parent_comment_div: @parentcomment.id} }
    
   end
  end

  def update
    @comment = Ucomment.find(params[:id])

    if @comment.update(comment_params)
      helper_redirect_to_comment
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Ucomment.find(params[:ucomment])

    if @comment.topucomment_id.nil?
      helper_destroy_all_children_of_topucomment(@comment)
      @comment.deleted = true
      @comment.save
      redirect_to root_path
    else
      @comment.deleted = true
      @comment.save
      respond_to do |format|
        format.js {render 'ajax_delete_subcomment.js.erb'}
      end
    end  
  end

  private
  
  def comment_params
    params.require(:ucomment).permit(:title, :body,
                   :positive, :anonymous, :rate, :topucomment_id, 
                   :user_id, :company_id, :deleted)
  end

end
