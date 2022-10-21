class User < ApplicationRecord
  validates :name, presence: true
  has_many :posts
  def most_recent_posts
    posts.order('created_at Desc').last(3)
  end
end
