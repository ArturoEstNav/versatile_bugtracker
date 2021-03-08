Rails.application.routes.draw do
  get 'tickets/new'
  get 'tickets/edit'
  get 'tickets/show'
  get 'projects/new'
  get 'projects/edit'
  get 'projects/show'
  get 'projects/index'
  # patch 'tickets/update_hours/:id' => "tickets#update_hours", as: :update_hours_ticket

  devise_for :users, controllers: { invitations: 'users/invitations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :events, only: [ :new, :edit, :index ]
  end
  resources :projects, only: [ :create, :edit, :show, :index ] do
    resources :events, only: [ :new ]
  end
  resources :tickets, only: [ :new, :edit, :show, :index, :create, :update, :update_hours ] do
    resources :memos
    resources :events, only: [ :new, :create ]
  end
end
