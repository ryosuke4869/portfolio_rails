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
  resources :categories

  resources :posts do
    #いいね機能のルーティング
    resource :likes, only: [:create, :destroy]
    #ブックマーク機能のルーティング
    resource :bookmarks, only: [:create, :destroy]
    #コメント機能のルーティング
    resources :comments, only: [:edit, :update, :create, :destroy]
  end

  resources :items do
    collection do
      get 'search_items', to: 'items#search_items'

    end
  end


end
