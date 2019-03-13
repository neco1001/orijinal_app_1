Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'

  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts, only: [:create, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
  resources :relationships,       only: [:create, :destroy]
end
