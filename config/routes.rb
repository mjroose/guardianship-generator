Rails.application.routes.draw do
  resources :guardianships
  resources :parties

  root 'guardianships#index'
end
