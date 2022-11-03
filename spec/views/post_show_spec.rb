require 'rails_helper'
describe 'Posts-show', type: :feature do
  describe 'users/posts/show' do
    before(:each) do
      @user_one = User.create! name: 'John', photo: 'photo.svg', bio: 'lorem ipsum', postscounter: 0
      @user_two = User.create! name: 'Eric', photo: 'photo.svg', bio: 'lorem ipsum', postscounter: 0
      @post1 = @user_one.posts.create!(title: 'first post', text: 'description', commentscounter: 0, likescounter: 0)
      @post2 = @user_one.posts.create!(title: 'second post', text: 'description', commentscounter: 0, likescounter: 0)
      @comment_one = @post1.comments.create!(Text: 'comment one', user_id: @user_one.id)
      @comment_two = @post1.comments.create!(Text: 'comment two', user_id: @user_two.id)
      @like = @post1.likes.create!(user_id: @user_one.id)
      visit(user_post_path(@user_one.id, @post1.id))
    end
    scenario "can see the post's title." do
      expect(page).to have_content('first post')
    end
    scenario 'I can see who wrote the post.' do
      expect(page).to have_content('Post by: John')
    end
    scenario 'I can see how many comments it has.' do
      expect(page).to have_content('Comment 2')
    end
    scenario 'I can see how many likes it has.' do
      expect(page).to have_content('Likes 1')
    end
    scenario 'I can see the post body.' do
      expect(page).to have_content('description')
    end
    scenario 'I can see the comment each commentor left.' do
      expect(page).to have_content('comment one')
      expect(page).to have_content('comment two')
    end
    scenario 'I can see the username of each commentor' do
      expect(page).to have_content('John')
      expect(page).to have_content('Eric')
    end
  end
end
