Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  root 'hello#index'

  #get 'posts' => 'posts#index'
  #get 'posts/new' => 'posts#new'
  #post 'posts' => 'posts#create'
  #get 'posts/:id' => 'posts#show',as: 'post'
  #patch 'posts/:id' => 'posts#update'
  #delete 'posts/:id' => 'posts#destroy' 
  #get 'posts/:id/edit' => 'posts#edit', as:'edit_post'
  
  resources :users, only: [:show]
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  get 'posts/rank/:name' => 'posts#rank', as: 'post_rank'
end
