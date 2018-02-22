Rails.application.routes.draw do
  get 'examinations/index'

  get 'examinations/show'

  get 'examinations/new'

  get 'examinations/edit'

  get 'examinations/destroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
