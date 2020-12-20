Rails.application.routes.draw do
  root 'posts#index'
  get 'about' => 'pages#about'
  get 'image' => 'pages#image'
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:create]
end
