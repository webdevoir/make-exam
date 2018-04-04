class Admin::ApplicationController < ApplicationController
  protect_from_forgery with: :exception
  

  before_action :configure_permitted_parameters, if: :devise_controller?

   protected

	  def upgraded?
	    Subscription.find_by(user_id: current_user.id)
	  end

	  helper_method :upgraded?

	  def configure_permitted_parameters
	    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
	    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	  end
end
