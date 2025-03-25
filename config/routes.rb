Rails.application.routes.draw do
  get "account_dashboard/show"
  resource :session
  resources :passwords, param: :token

  resources :companies, only: [ :new, :create ]

  resources :users, only: [ :new, :create, :edit, :update ] do
    get "setup", on: :member
  end

  resources :invitations

  resource :account_dashboard, only: [ :show ], path: "account"

  get "up" => "rails/health#show", as: :rails_health_check

  root "account_dashboard#show"
end
