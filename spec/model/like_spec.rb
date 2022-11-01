# require 'rails_helper'

# RSpec.describe Like, type: :model do
#   user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
#   post = Post.create(title: 'Title', text: 'Body', user_id: user.id)
#   subject { Like.new(post_id: post.id, user_id: user.id) }
#   before { subject.save }

#   context 'validations' do
#     it 'Not valid without a post_id' do
#       subject.post_id = nil
#       expect(subject).to_not be_valid
#     end
#     it 'Not valid without a user_id' do
#       subject.user_id = nil
#       expect(subject).to_not be_valid
#     end
#   end
# end
