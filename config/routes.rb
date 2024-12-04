Rails.application.routes.draw do
  devise_for :users
  
  # Expenses routes
  resources :expenses do
    collection do
      get 'edit_by_date', to: 'expenses#edit_by_date'
      patch 'update_by_date', to: 'expenses#update_by_date'
    end
  end

  # Root path (change this if you don't need HomeController)
  root "transactions#index"  # Change this to the appropriate controller/action
  
  # Other resource routes
  resources :posts
  resources :items # If you're using this resource, leave it here
end
