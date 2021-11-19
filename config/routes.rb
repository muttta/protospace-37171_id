Rails.application.routes.draw do
  
  get 'users/show'
  devise_for :users

  #get 'prototypes/index'
  root to: "prototypes#index"
  resources :users, only: [:create, :new, :show]
  resources :prototypes, only: [:create, :new, :show, :edit, :update, :destroy] do
     resources :comments, only: [:create ]
  end
end
