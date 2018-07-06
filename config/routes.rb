Rails.application.routes.draw do

  namespace :admin do
    resources :dashboard, only: [:landing]
    root to: "/admin/dashboard#landing"
    resources :ads, only: [:new, :create, :edit, :update, :index, :destroy] do
      get   :activate
      get   :payment
    end
  end

  resources :ads

  mathjax 'mathjax'

  resources :posts do
    resources :comments
  end

  resources :subscriptions do
  end

  resources :payments

  get 'paypal/checkout', to: 'subscriptions#paypal_checkout'
  get 'payment/checkout', to: 'payments#paypal_checkout'
  get 'upgrade', to: 'subscriptions#upgrade'

  resources :examinations do
  	member do
    	get   :take
  	end
    resources :scores
  	resources :questions do
  		resources :answers
      put :preview
      collection do
        get :preview
      end
  	end
  end

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'examinations#index'
  root to: 'pages#landing'
  get 'user_scores' => 'scores#user_scores'

  get "/pages/:page" => "pages#show"
end
