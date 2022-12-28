Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  get 'users/profile' => 'users/profiles#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #アクセスしたらTop画面に
  root to: 'tops#index'
  get "tops/index"

  # 投稿用のroute
  resources :posts
  #like機能のルーティング
  resources :posts do
    resource :likes, only: [:create, :destroy]
  end

  resources :posts do
    resources :comments, only: [:edit, :update, :create, :destroy]
  end

end
