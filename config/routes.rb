Rails.application.routes.draw do
  
  devise_for :users
  
  root to: 'homes#top'
  
  resources :users, only: [:index, :show, :edit, :update]
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
end
