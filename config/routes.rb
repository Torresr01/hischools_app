Rails.application.routes.draw do
  
  devise_for :users

 
  root "high_schools#index"

  resources :high_schools
end
