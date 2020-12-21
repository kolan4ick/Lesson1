Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get 'about' => 'pages#about'
  get 'image' => 'pages#image'
  resources :posts do
    resources :comments
  end
  resources :comments
end
