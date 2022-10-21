require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    user = User.new(name: 'Test', postscounter: 0)
    user.save
  end

  subject { Post.new(title: 'Title', text: 'test', commentscounter: 1, likescounter: 0, user_id: 1) }

  before { subject.save }

  context 'validations' do
    it 'Comments_counter should be integer' do
      expect(subject).to be_valid
    end
    it 'Title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Commentscounter should be present' do
      subject.commentscounter = nil
      expect(subject).to_not be_valid
    end

    it 'Increases the comments' do
      counter = User.find(1).postscounter
      subject.update_post_counter
      expect(User.find(1).postscounter).to eq(counter + 1)
    end
  end
end
