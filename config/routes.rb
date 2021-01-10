Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'guide-section', to: 'guidesections#index'
  get 'certification-section', to: 'certificationsections#index'
  get 'debate-section', to: 'debatesections#index'
  get 'drama-section', to: 'dramasections#index'
  get 'speech-section', to: 'speechsections#index'
  get 'discussion-section', to: 'discussionsections#index'
  get 'spring-camp', to: 'springcamps#index'
  get 'freshman-welcome-party', to: 'freshmanwelcomeparties#index'
  get 'jounan', to: 'jounans#index'
  get 'summer-camp', to: 'summercamps#index'
  get 'halloween-party', to: 'halloweenparties#index'
  get 'nanzan-festival', to: 'nanzanfestivals#index'
  get 'christmas-party', to: 'christmasparties#index'
  get 'farewell-party', to: 'farewellparties#index'
  get 'nanzan-ess', to: 'nanzanesses#index'
  get 'section-test', to: 'sectiontests#index'
  get 'event', to: 'events#index'
  get 'nanzaness-originalwebapp', to: 'nanzanessoriginalwebapps#index'

  resources :inquiries, only: [:index, :new, :create]
  
  get 'login', to: 'sessions#new'
  get 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #ActionMailerの内容を開発(ローカル)環境で確認できるようにするための設定
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :users 
end


