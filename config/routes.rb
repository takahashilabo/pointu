Rails.application.routes.draw do
  devise_for :users
  resources :expenses do
    collection do
      get 'edit_by_date', to: 'expenses#edit_by_date'
      patch 'update_by_date', to: 'expenses#update_by_date'
    end
  end
  
  resources :expenses, only: [:index, :new, :create, :edit, :update, :destroy]
  # 必要に応じてルートを追加
  root "home#index"
  resources :posts
  resources :items # 追加したリソース
end
