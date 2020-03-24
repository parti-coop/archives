Rails.application.routes.draw do
  root 'archives#index'

  devise_for :users

  resources :archives do
    member do
      get '/categories/edit', to: 'archives#edit_categories'
      patch :update_categories
      get '/categories/:category_slug', to: 'archives#show', as: :category
    end
  end
  resources :archive_documents
end
