require 'sidekiq/web'

Rails.application.routes.draw do
  # Routing for budget section. Generates:
  # /budgets
  # /budgets/1
  # /budgets/1/groups
  # /groups/2
  # /groups/2/categories
  # /categories/3
  #resources :budgets do |budgets|
  #  budgets.groups :categories, :name_prefix => "budget_"
  #end
  #resources :groups do |group|
  #  groups.resources :categories, :name_prefix => "group_"
  #end
  #resources :categories
  
  resources :budgets do
    resources :groups do
      resources :categories
    end
  end

  resources :accounts
  resources :goals

  resources :retirements

  resources :calculate_debts
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
