module UcommentsHelper

	def helper_count_all_subcomments(comment, all_subcomments)  
    if comment.subucomments.present?
      for subcomment in comment.subucomments do
        all_subcomments.push subcomment
        helper_count_all_subcomments(subcomment, all_subcomments)
      end
    end
    return all_subcomments.size
  end

  def helper_redirect_to_comment
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

  def helper_destroy_all_children_of_topucomment(comment)
      if comment.subucomments.present?
        for subcomment in comment.subucomments do
          subcomment.deleted = true
          subcomment.save
          helper_destroy_all_children_of_topucomment(subcomment)
        end  
      else
        comment.deleted = true
        comment.save  
      end
  end  

end
