Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'welcome/index'
  
  resources :articles
  resources :posts do
    resources :comments
  end
  root 'welcome#index'
end
