class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :ucomment

	def self.add(user, comment, like_dislike)
		vote = where(user_id: user.id, ucomment_id: comment.id ).first_or_create
    if vote.is_liked == like_dislike
      false
    else
      vote.is_liked = like_dislike
		  vote.save
      true
    end
  end

  def self.undo(user, comment)
    vote = where(user_id: user.id, ucomment_id: comment.id).first
    if vote
      vote.is_liked = 0
      vote.save
    else
      false
    end
  end

end
