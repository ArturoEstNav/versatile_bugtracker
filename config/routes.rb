Rails.application.routes.draw do
  get 'users/new'
  get 'users/edit'
  get 'users/show'
  get 'users/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :events, only: [ :new, :edit ]
  end
  resources :projects, only: [ :create, :edit, :show ] do
    resources :events, only: [ :new ]
  end
  resources :tickets, only: [ :new, :edit, :show, :index, :create, :update ] do
    resources :memos
    resources :events, only: [ :new, :create ]
  end
end
