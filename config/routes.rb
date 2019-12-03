Rails.application.routes.draw do
#  resources :dervaleras
  resources :valerons
  resources :valeractions
  resources :action_loaders

  get 'valeron/new'
  get 'valeron/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'welcome/index'
  
  resources :articles
  resources :posts do
    resources :comments
  end
  root 'welcome#index'
end
