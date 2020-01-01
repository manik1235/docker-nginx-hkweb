Rails.application.routes.draw do
  resources :landings
  resources :groups

  root to: 'landings#index'
end
