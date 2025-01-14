Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end

  resources :prototypes do
    resources :comments, only: [:create, :destroy, :edit, :update]
    resource :likes, only: [:create, :destroy]
  end

  resources :users, only: [:show, :index]

  resources :notifications, only: [:index]  # 通知機能のルーティング

  # ホームページのルーティングを追加
  get 'home', to: 'home#index'
  
  root to: 'home#index'
end
