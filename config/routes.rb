Rails.application.routes.draw do
  root 'posts#index'
  get 'about' => 'pages#about'
  get 'image' => 'pages#image'
  resources :posts
end
