Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  resources :guardianships do
    resources :parties
  end

  root 'home#index'
end
