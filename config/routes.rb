Rails.application.routes.draw do
  get 'home/top'
  get 'home/about'
  root to: 'homes#top'
  devise_for :users
  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  resources :books


end
