Rails.application.routes.draw do
  get '/' => "home#top"
  get 'home/about' => "home#about"
  get 'users/show'
  devise_for :users
  root 'users#show'
  get "/top" => "books#start", as: "start"
  resources :books, only: [ :new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [ :show, :edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
