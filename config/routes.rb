Rails.application.routes.draw do
  devise_for :users

  # Expenses routes (New, Create, Edit, Update)
  resources :expenses, only: [:new, :create, :edit, :update] do
    collection do
      get 'edit_by_date', to: 'expenses#edit_by_date'
      patch 'update_by_date', to: 'expenses#update_by_date'
    end
  end
  
  # Transactions routes
  resources :transactions, only: [:new, :create, :index]  # Adjust based on your needs

  # Root path (direct to transactions#index)
  root "transactions#index"  # Assuming your calendar or list of transactions is in transactions#index
  
  # Other resource routes
  resources :posts
  resources :items
end
