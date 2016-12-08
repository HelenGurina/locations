Rails.application.routes.draw do

  get 'register' => "users#new", :as => 'register'
  get 'login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'log_out'

  	resources :records, :users, :sessions 

  	root 'location#index'

  	match '/' => 'location#create', :via => :post
  	match '/' => 'location#update', :via => :post
  	match '/' => 'location#destroy', :via => :post
end

