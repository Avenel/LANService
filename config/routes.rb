LANService::Application.routes.draw do
  resources :vendors


  resources :orders


  resources :games


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end