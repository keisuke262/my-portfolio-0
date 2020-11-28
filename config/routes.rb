Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  get 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
end
