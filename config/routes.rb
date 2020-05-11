Rails.application.routes.draw do
  devise_for :users

  resources :archives do
    member do
      get '/categories/edit', to: 'archives#edit_categories'
      patch :update_categories
      get '/categories/:category_slug', to: 'archives#show', as: :category
    end
  end
  resources :archive_documents do
    get :download, on: :member
  end

  get 'pages/about', as: 'about'

  root 'archives#index'
end
