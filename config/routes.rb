Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  resources :guardianships do
    resources :parties
  end

  get 'clio/callback', to: 'clio#callback'
  get 'clio/log_in', to: 'clio#log_in'

  root 'home#index'
end
