Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'guide-section', to: 'guidesections#index'
  get 'certification-section', to: 'certificationsections#index'
  get 'debate-section', to: 'debatesections#index'
  get 'drama-section', to: 'dramasections#index'
  get 'speech-section', to: 'speechsections#index'
  get 'discussion-section', to: 'discussionsections#index'

  get 'login', to: 'sessions#new'
  get 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
end
