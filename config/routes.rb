Rails.application.routes.draw do


  resources :examinations do
  	resources :questions
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'examinations#index'
end
