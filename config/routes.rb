AuthTemplate::Application.routes.draw do

  devise_for :users, :admins

  get '/token' => 'home#token', as: :token

  resources :home, only: :index
  resources :admins, only: :index

  #root 'home#index'

  authenticated :user do
  root to: 'home#index', as: :authenticated_root
  end

  unauthenticated do
  root to: "home#index"
  end
end
