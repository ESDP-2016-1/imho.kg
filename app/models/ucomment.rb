class Ucomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :subucomments, class_name: "Ucomment", foreign_key: 'topucomment_id'

  belongs_to :topucomment, class_name: 'Ucomment'

  has_many :images

  has_many :favorites
  has_many :ucomments, -> { uniq }, through: :favorites

  has_many :votes, dependent: :destroy
  has_many :users,  -> { distinct }, through: :votes

  self.per_page = 10

  def self.get_top_comments
    return where(topucomment_id: nil, deleted: false)
  end

  def self.for_view_state(sorting_order_by, page_number, request_params = nil)
    if request_params.nil?
      get_top_comments.order(sorting_order_by).paginate(page:page_number)
    else
      where(request_params).order(sorting_order_by).paginate(page:page_number)
    end
  end

  def self.count_total_positive
    where(topucomment_id: nil, positive: true, deleted: false).count
  end

  def self.count_total_negative
    where(topucomment_id: nil, positive: false, deleted: false).count
  end

  def count_votes(action = :like)
    like_dislike = action == :like ? 1 : -1
    Vote.where(ucomment_id: self.id, is_liked: like_dislike).count
  end

  def get_vote_of_user(user)
    Vote.voted_value(user, self)
  end

end
