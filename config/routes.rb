# frozen_string_literal: true

ValeraModule::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'welcome/index'

  get 'game/index'
  get 'game/show'

  resources :articles
  resources :posts do
    resources :comments
  end
  root 'welcome#index'

  get 'execute_action', to: 'game#execute_action', as: :execute_action

  get 'refresh', to: 'game#refresh', as: :refresh

end

