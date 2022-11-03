# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'GET /index' do
#     before(:each) do
#       @user = User.new(name: 'Tom', postscounter: 0)
#       @user.save
#       get '/users/1/posts'
#     end

#     # posts index action
#     it 'http request is successfull' do
#       expect(response).to have_http_status(:success)
#     end

#     it 'renders correct' do
#       expect(response).to render_template(:index)
#     end
#   end
# end

# RSpec.describe 'Posts', type: :request do
#   describe 'GET /show' do
#     before(:each) do
#       @user = User.new(name: 'Tom', postscounter: 0)
#       @post = Post.new(title: 'Title', text: 'text test', commentscounter: 1, likescounter: 0, user_id: 1)
#       @user.save
#       @post.save
#     end
#     # posts show action
#     it 'renders correct templete when the show action is triggered' do
#       get '/users/1/posts/2'
#       expect(response).to render_template(:show)
#     end
#   end
# end
