class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :ucomment

	def self.add(user, comment, like_dislike)
    return nil if user.nil? || comment.nil?

    like_dislike = 1 if like_dislike == :like
    like_dislike = -1 if like_dislike == :dislike

    return nil unless like_dislike.kind_of?(Fixnum)

    if like_dislike >= 1
      like_dislike = 1
    elsif like_dislike <= -1
      like_dislike = -1
    else
      return nil
    end

    vote = where(user_id: user.id, ucomment_id: comment.id ).first_or_create

    if vote.is_liked.nil? || vote.is_liked == 0
      vote.is_liked = like_dislike
      vote.save
      return like_dislike == 1 ? :like : :dislike
    end

    if vote.is_liked == like_dislike
      vote.is_liked = 0
      vote.save
      :none
    else
      vote.is_liked = like_dislike
      vote.save
      return like_dislike == 1 ? :like : :dislike
    end
  end


  def self.voted_value(user, comment)
    vote = where(user_id: user.id, ucomment_id: comment.id).first
    return nil unless vote
    return nil if vote.is_liked == 0
    vote.is_liked == 1  ? :like : :dislike
  end

end
