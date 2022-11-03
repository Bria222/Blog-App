require 'rails_helper'

RSpec.describe 'USers', type: :feature do
  describe 'user#index' do
    before(:each) do
      User.create! name: 'John', photo: 'photo.svg', bio: 'lorem ipsum', postscounter: 0
      User.create! name: 'Eric', photo: 'photo.svg', bio: 'lorem ipsum', postscounter: 0
      visit root_path
      @user = User.first!
    end
    scenario 'I can see the username of all other users.' do
      expect(page).to have_content('Eric')
    end
    scenario 'I can see the profile picture for each user.' do
      expect(page).to have_selector('i')
    end
    scenario 'I can see the number of posts each user has written.' do
      expect(page).to have_content('Number of posts 0')
    end
    scenario "When I click on a user, I am redirected to that user's show page" do
      visit(user_path(@user.id))
      expect(page).to have_content('Bio')
    end
  end
end
