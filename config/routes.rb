Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
end
