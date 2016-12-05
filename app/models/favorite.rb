class Favorite < ActiveRecord::Base
	belongs_to :user
	belongs_to :ucomment

	def self.add(user,comment)
    return if user.nil? || comment.nil?
    user_id = user.id
    comment_id = comment.id
    exists = where(user_id: user_id, ucomment_id: comment_id).first
    if exists
      exists.destroy
      :removed
    else
      create(user_id: user_id, ucomment_id: comment_id)
      :added
    end
  end

  def self.is_in_favorite(user, comment)
    if where(user_id: user.id, ucomment_id: comment.id).first
      :added
    else
      :none
    end
  end
end
