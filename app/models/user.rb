class User < ApplicationRecord
  validates :name, presence: true, length: { in: 4..25 }
  validates :postscounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  has_many :comments
  has_many :likes
  has_many :posts
  def most_recent_posts
    posts.order('created_at Desc').last(3)
  end
end
