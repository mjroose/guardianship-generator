Rails.application.routes.draw do
  resources :guardianships do
    resources :parties
  end

  root 'guardianships#index'
end
