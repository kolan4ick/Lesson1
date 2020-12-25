Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'
  resources :comments, only: [:destroy]
  resources :posts do
    resources :likes
  end
  resources :users, only: [:show]
  post ':object_type/:object_id/comments', to: 'comments#create', as: 'comments'
end
