class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def login_required
  	if current_user.blank? 
    		redirect_to root_url, :notice => "Please log in to add locations!"
  	end		
  end

end
