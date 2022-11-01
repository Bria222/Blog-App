class Comment < ApplicationRecord
  validates :Text, presence: true
  belongs_to :post
  belongs_to :user
  after_save :update_comment_counter

  def update_comment_counter
    post.increment!(:commentscounter)
  end
end
