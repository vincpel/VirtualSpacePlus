Rails.application.routes.draw do
     
	
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
  resources :books
  resources :electronics
  resources :tutorings
  resources :workgroups
 
  #resources :researches

  get    'r'       =>  'researches#index'
  get    'r_advc'  =>  'researches#newAdvanced'
  get    'r/:id'   =>  'researches#show'
  post   'new_r'   =>  'researches#create' 

  # try those later 
  get    'home'    => 'pages#home'
  get    'help'    => 'pages#help'
  get    'about'   => 'pages#about'
  get    'contact' => 'pages#contact'
  get    'book'    => 'books#index'

  
  
end



