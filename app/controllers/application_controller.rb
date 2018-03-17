class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

   protected

	  def upgraded?
	    Subscription.find_by(user_id: current_user.id)
	  end

	  helper_method :upgraded?
end
