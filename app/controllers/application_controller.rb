class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  		# user_path(current_user) #your path
  		'/pages/profile'
  		
  		# if current_user.user_type == "Employer" && current_user.employer_id
  		# 	employer_path(current_user.employer_id)
  		# elsif current_user.user_type == "Worker"
  		# 	worker = Worker.find_by(user_id: current_user.id)
    #     if worker
  		# 	 worker_path(worker)
    #     else
    #       "/pages/construction"
    #     end
  		# elsif current_user.user_type == "Prime Contractor" && current_user.prime_id
  		# 	prime_path(current_user.prime_id)
  		# elsif current_user.user_type == "Admin"
  		# 	admin_root_path
  	 # 	else
  	 # 	 	"/pages/construction"
  		# end
	end

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
