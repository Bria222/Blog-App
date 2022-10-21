class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  after_save :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def update_post_counter
    user.increment!(:postscounter)
  end

  def recent_comments
    comments.order('created_at Desc').last(5)
  end
end
