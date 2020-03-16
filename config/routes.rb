Rails.application.routes.draw do
  root 'archives#index'

  devise_for :users

  resources :archives
end
