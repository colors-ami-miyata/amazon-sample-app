Rails.application.routes.draw do
  root "product#index"


  resources :product do
    resources :user_product, only: [:create, :destroy]
  end

  devise_for :users, :controllers => {
	  :registrations => 'users/registrations',
	  :sessions => 'users/sessions',
	  :passwords => 'users/passwords' 
  } 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
