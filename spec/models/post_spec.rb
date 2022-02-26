require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.build(:post) } 

  describe '投稿の保存' do
    context '投稿できる場合' do
      it '画像とテキストがあれば投稿できる' do
        expect(post).to be_valid
      end
      it 'テキストがあれば投稿できる' do
        tweet.image.purge  
        expect(post).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'テキストが空では投稿できない' do
        post.text = ''
        post.valid?
        expect(post.errors.full_messages).to include("Text can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        post.user = nil
        post.valid?
        expect(post.errors.full_messages).to include('User must exist')
      end
    end
  end
end