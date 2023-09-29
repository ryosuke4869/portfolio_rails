Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  namespace :users do
    resource :profile, only: [:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # アクセスしたらTop画面に
  root to: 'tops#index'

  resources :posts do
    # いいね機能のルーティング
    resources :likes, only: [:create, :destroy]
    # ブックマーク機能のルーティング
    resources :bookmarks, only: [:create, :destroy]
    # コメント機能のルーティング
    resources :comments, only: [:edit, :update, :create, :destroy]

    get 'search_items', to: 'items#search_items'
  end
  resources :post_items, only: [:create, :destroy]
end
