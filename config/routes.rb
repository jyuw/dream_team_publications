Rails.application.routes.draw do
  root controller: :index, action: :index
  devise_for :users
  root controller: :index, action: :index
  resources :articles, only: [:new, :create, :show, :destroy]
end
