Rails.application.routes.draw do
  get 'tickets/new'
  get 'tickets/edit'
  get 'tickets/show'
  get 'projects/new'
  get 'projects/edit'
  get 'projects/show'
  get 'projects/index'
  get 'pages/demo'
  get 'pages/guest'
  patch 'tickets/update_hours/:id' => "tickets#update_hours", as: :update_hours_ticket
  patch 'tickets/close_ticket/:id' => "tickets#close_ticket", as: :close_ticket

  devise_for :users, controllers: { invitations: 'users/invitations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :events, only: [ :new, :edit, :index ]
  end
  resources :projects, only: [ :create, :edit, :update, :show, :index ] do
    resources :events, only: [ :new ]
  end
  resources :tickets, only: [ :new, :edit, :show, :index, :create, :update ] do
    resources :memos
    resources :events, only: [ :new, :create ]
  end
  resources :working_tickets, only: [ :show, :index ]
end
