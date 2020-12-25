Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :posts

  resources :comments, only: [:destroy]

  post ':object_type/:object_id/comments', to: 'comments#create', as: 'comments'
end
