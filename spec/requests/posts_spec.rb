require 'rails_helper'
describe PostsController, type: :request do
  let(:user) { FactoryBot.build(:user) }
  let(:post) { FactoryBot.create(:post, user: user) }

  before do
    post
    sign_in user
  end

  
end
