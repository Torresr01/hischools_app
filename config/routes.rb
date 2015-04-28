Rails.application.routes.draw do
  devise_for :users

  root "schools#index"
  get 'search', to: 'schools#search'
  
  resources :schools
end
