Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  resources :users
  devise_for :users
  # devise_for :users, :controllers => {
  #    :registrations => 'users/registrations',
  # }

  devise_scope :user do
    get '/signup', to: 'users/registrations#new'
    post '/signup',  to: 'users/registrations#create'
  end

end
