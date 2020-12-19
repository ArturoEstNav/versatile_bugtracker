Rails.application.routes.draw do
  get 'tickets/new'
  get 'tickets/edit'
  get 'tickets/show'
  get 'memos/new'
  get 'memos/edit'
  get 'memos/show'
  get 'users/new'
  get 'users/edit'
  get 'users/show'
  get 'users/index'
  get 'projects/new'
  get 'projects/edit'
  get 'projects/show'
  get 'projects/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :projects, only: [ :create, :update, :show ]
  resources :tickets, only: [ :create, :update, :show, :index ] do
    resources :memos, only: [ :create, :update, :show ]
  end
end
