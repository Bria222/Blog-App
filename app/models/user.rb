class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true, length: { in: 4..25 }
  validates :postscounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 },
                           allow_nil: true
  has_many :comments
  has_many :likes
  has_many :posts

  def most_recent_posts
    posts.order('created_at Desc').last(3)
  end

  def admin?
    :role == 'admin'
  end
end
