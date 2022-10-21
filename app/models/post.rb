class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  after_save :update_post_counter

  private

  def update_post_counter
    user.increment!(:postscounter)
  end

  def recent_comments
    comments.order('created_at Desc').last(5)
  end
end
