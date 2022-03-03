Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#guest_sign_in'
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#follower', as: 'followers'
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    collection do
    end
  end

  get 'search' => 'searches#search'

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end
