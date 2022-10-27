require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users' do
    before(:each) do
      @user = User.new(name: 'Tom', postscounter: 0)
      @user.save
    end
    # users index action
    it 'renders the index template' do
      get '/users'
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
    # users show action
    it 'renders the show template' do
      get '/users/1'
      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end
  end
end
