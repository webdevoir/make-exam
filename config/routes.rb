Rails.application.routes.draw do


  resources :subscriptions do
  end
  get 'paypal/checkout', to: 'subscriptions#paypal_checkout'
  get 'upgrade', to: 'subscriptions#upgrade'

  resources :examinations do
  	member do
    	get   :take
  	end
    resources :scores
  	resources :questions do
  		resources :answers
  	end
  end

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'examinations#index'

  get 'user_scores' => 'scores#user_scores'
end
