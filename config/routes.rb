Rails.application.routes.draw do


  resources :examinations do
  	member do
    	get   :take
  	end
    resources :scores
  	resources :questions do
  		resources :answers
  	end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'examinations#index'
end
