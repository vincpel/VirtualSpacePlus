Rails.application.routes.draw do
     

  resources :comments
  resources :tutorings
	# on peut faire sa aussii resources :resumes, only: [:index, :new, :create, :destroy]
  #resources :admin 

  get '/users/all' => 'users#index' 
 
       
  #resources :visitor 
  
  root to: 'visitors#index'
  
  #resources :users
  
  devise_for :users, :path => 'accounts'
  get '/users' =>   'users#show', :as => :user_root
  get 'users/u_ads' => 'users#u_ads'
  resources :users do
    resources :ads
  end
  
  #resources :ads
  
  resources :ads
  get 'captcha'  =>   'ads#capstore'
  #post 'ads/:id' => 'ads#sellAdd'
  
  get 'books/new/:id' => 'books#createfromtemplate'
  resources :books
  
  get 'electronics/new/:id' => 'electronics#createfromtemplate'
  resources :electronics
  
  get 'tutorings/new/:id' => 'tutorings#createfromtemplate'
  resources :tutorings
  
  get 'workgroups/new/:id' => 'workgroups#createfromtemplate'
  resources :workgroups
 
  #resources :researches
  get    'r'       =>  'researches#index'
  get    'r_advc'  =>  'researches#newAdvanced'
  get    'r/:id'   =>  'researches#show'
  post   'new_r'   =>  'researches#create' 
  #resources :researches
  post   'mail'   =>  'ad_mailer#sendmail' 
  # try those later 
  get    'home'    => 'pages#home'
  get    'help'    => 'pages#help'
  get    'about'   => 'pages#about'
  get    'contact' => 'pages#contact'
  get    'book'    => 'books#index'

  
  
end



