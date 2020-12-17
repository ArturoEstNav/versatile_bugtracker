Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :projects, :memos, only: [ :create, :update, :show ]
  resources :tickets, only: [ :create, :update, :show, :index ]
end
