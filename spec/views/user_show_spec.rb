require 'rails_helper'
RSpec.describe 'Users-show', type: :feature do
  describe 'users show' do
    before(:each) do
      @user_one = User.create! name: 'John', photo: 'photo.svg', bio: 'lorem ipsum', postscounter: 0
      @user_two = User.create! name: 'Eric', photo: 'photo.svg', bio: 'lorem ipsum', postscounter: 0
      @post1 = @user_one.posts.create!(title: 'first post', text: 'description', commentscounter: 0, likescounter: 0)
      @post2 = @user_one.posts.create!(title: 'second post', text: 'description', commentscounter: 0, likescounter: 0)
      @post3 = @user_one.posts.create!(title: 'third post', text: 'description', commentscounter: 0, likescounter: 0)
      @post4 = @user_one.posts.create!(title: 'fourth post', text: 'description', commentscounter: 0, likescounter: 0)
      @post5 = @user_one.posts.create!(title: 'fifth post', text: 'description', commentscounter: 0, likescounter: 0)

      @comment = @post1.comments.create!(Text: 'comment one', user_id: @user_one.id)
      @comment2 = @post1.comments.create!(Text: 'comment two', user_id: @user_two.id)
      visit(user_path(@user_one.id))
    end
    scenario "can see the user's profile picture" do
      expect(page).to have_selector('i')
    end
    scenario 'I can see the username of all other users.' do
      expect(page).to have_content('John')
    end
    scenario 'I can see the number of posts the user has written.' do
      expect(page).to have_content('Total posts: 5')
    end
    scenario "I can see the user's bio." do
      expect(page).to have_content('lorem ipsum')
    end
    scenario "I can see the user's first 3 posts." do
      expect(page).to have_content 'third post'
      expect(page).to have_content 'second post'
      expect(page).to have_content 'first post'
    end
    scenario "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_content 'View all posts'
    end
    scenario "When I click a user's post, it redirects me to that post's show page" do
      visit(user_posts_path(@user_one.id))
      expect(page).to have_current_path user_posts_path(@user_one.id)
    end
    scenario 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_link 'View all posts'
      expect(page).to have_current_path user_posts_path(@user_one)
    end
  end
end
