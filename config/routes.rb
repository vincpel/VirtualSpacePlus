Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  #resources :users
  resources :users do
    resources :adds
  end
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



