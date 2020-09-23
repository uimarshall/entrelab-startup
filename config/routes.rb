# THE MODUS OPERANDI
# ******************************************************************************************
# 1. A req is made to a route e.g 'http://localhost:3000/about'
# The router then looks for the pages folder('pages#about') and locate the 'PagesController'
# Inside the controller it looks for the 'about' method and calls it.
# The 'about' mtd then looks for the corresponding views(about.html.erb) inside the 'views folder'
# The 'about.html.erb' is then injection into 'application.html.erb' via '<%= yield %>' in the body
# **************************************************************************************************

Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users do
    resource :profile
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #This means a user points its request to d "pages" controller and calls the "home" mtd
  #The controller then picks the corresponding 'home page in the views' and sends to d user
  
  get 'about', to: 'pages#about' #A 'get' req points to '/about' and calls about mtd in pages controller
  resources :contacts, only: [:create] #short way of writing route
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
