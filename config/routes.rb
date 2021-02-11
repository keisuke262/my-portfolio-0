Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'guide-section', to: 'guidesections#index'
  get 'certification-section', to: 'certificationsections#index'
  get 'debate-section', to: 'debatesections#index'
  get 'drama-section', to: 'dramasections#index'
  get 'speech-section', to: 'speechsections#index'
  get 'discussion-section', to: 'discussionsections#index'
  get 'spring-camp', to: 'springcamps#index'
  get 'freshman-festival', to: 'freshmanfestivals#index'
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
  get 'study', to: 'studies#index'
  

  resources :inquiries, only: [:index, :new, :create]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #ActionMailerの内容を開発(ローカル)環境で確認できるようにするための設定
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'signup', to: 'users#new'
  get 'webapp-toppages', to: 'webapptoppages#index'

  post 'users/:id/followings' => 'users#followings'
  post 'users/:id/followers' => 'users#followers'
  post 'users/:id/favoriteposts' => 'users#favoriteposts'
  # post 'webapp-toppages' => 'webapptoppages#index'


  # resourcesにはmemberとcollectionという
  # URLを深堀するオプションを付与することができる
  # memberとcollectionの違いはUserを:idで特定する必要のある
  # pageであるかどうか、idで特定必要ならmemberを使用
  resources :users, only: [:index, :show, :create, :edit, :update] do
    member do 
      get :followings
      get :followers
    end
  end

  resources :users, only: [:index, :show, :create, :edit, :update] do
    member do
      get :favoriteposts
    end
  end

  resources :posts, only: [:create, :destroy, :edit, :update]
  # Userがfollow, unfollowできるために必要なRouting
  # なぜならfollow, unfollowするとは中間テーブルを保存 or 削除することであるから
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end

