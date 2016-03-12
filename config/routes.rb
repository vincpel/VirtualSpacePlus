Rails.application.routes.draw do

  #resources :visitor 
  
  root to: 'visitors#index'
  
  


  #resources :users
  
  devise_for :users, :path => 'accounts'
  get '/users' =>   'users#show', :as => :user_root
  get 'users/u_ads' => 'users#u_ads'
  resources :users do
    resources :adds
  end
  
  #resources :adds
  
  resources :adds
  

  # try those later 
  #root                'pages#home'
  get    'home'    => 'pages#home'
  get    'help'    => 'pages#help'
  get    'about'   => 'pages#about'
  get    'contact' => 'pages#contact'
  #get    'signup'  => 'users#new'
  #get    'login'   => 'sessions#new'
  #post   'login'   => 'sessions#create'
  #delete 'logout'  => 'sessions#destroy'
  get    'book'    => 'books#index'
  #get    'login'   => 'sessions#new'

  
  
end



