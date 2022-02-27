require 'rails_helper'
describe PostsController, type: :request do
  let(:user) { FactoryBot.build(:user) }
  let(:post) { FactoryBot.create(:post, user: user) }

  before do
    post
    sign_in user
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
    end
    it 'レスポンスに投稿済みのテキストが存在する' do 
    end
    it 'レスポンスに投稿済みの画像URLが存在する' do 
    end
  end
end
