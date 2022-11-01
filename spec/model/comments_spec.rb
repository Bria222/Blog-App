# require 'rails_helper'

# RSpec.describe Comment, type: :model do
#   user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
#   post = Post.create(title: 'Title', text: 'Body', user_id: user.id)
#   subject { Comment.new(Text: 'Comment', user_id: user.id, post_id: post.id) }
#   before { subject.save }

#   context 'check' do
#     it 'if not valid without a text' do
#       subject.Text = nil
#       expect(subject).to_not be_valid
#     end
#     it 'if not valid without a user_id' do
#       subject.user_id = nil
#       expect(subject).to_not be_valid
#     end
#     it 'if not valid without a post_id' do
#       subject.post_id = nil
#       expect(subject).to_not be_valid
#     end
#   end
# end
