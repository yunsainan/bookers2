Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :update]
  get 'home/about' => 'homes#about', as: 'about'
end
