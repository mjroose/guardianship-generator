Rails.application.routes.draw do
  resources :guardianships

  root 'guardianships#index'
end
