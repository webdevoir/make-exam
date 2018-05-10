class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

  before_action :configure_permitted_parameters, if: :devise_controller?

   protected

	  def upgraded?
	    Subscription.find_by(user_id: current_user.id) if current_user
	  end

	  helper_method :upgraded?

	  def display_ad
	  	ads = Ad.where(status: "active")
	  	current_ad = ads.sample
	  	return current_ad
	  end

	  helper_method :display_ad

	  def configure_permitted_parameters
	    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
	    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	  end
end
