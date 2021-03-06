require 'sidekiq/web'

Rails.application.routes.draw do
  resources :user_options
  get 'search', to: 'users#search'

  resources :messages
  resources :rooms
  # Routing for budget section
  resources :budgets do
    resources :groups do
      resources :categories
    end
  end
  #routing for post with likes and comments 
  resources :posts do 
    resources :likes
    resources :comments
  end
  
  resources :socials
  resources :mentions, only: [:index]
  resources :mentioned_posts, only: [:index]
  resources :follows
  resources :followers, only: [:index]
  resources :followings, only: [:index]


  resources :accounts
  resources :goals
  
  resources :retirements
  get '/users', to: 'users#index'
  get '/user/:id', to: 'users#show', as: 'user'
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
