Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #This means a user points its request to d "pages" controller and calls the "home" mtd
  #The controller then picks the corresponding 'home page in the views' and sends to d user
  root to: "pages#home" 
end
