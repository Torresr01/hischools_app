Rails.application.routes.draw do
	
	get '/about' => 'pages#about'
	get '/contact' => 'pages#contact'

  devise_for :users

  root "schools#index"
  get 'search', to: 'schools#search'
  
  resources :schools do
  	resources :comments
  end
  resources :comments

end
