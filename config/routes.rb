Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update ]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy ]
  get 'home/about' => 'homes#about', as: 'about'
end
