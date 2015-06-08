class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user 
  helper_method :current_place

	def current_user 
	  @current_user ||= User.find(session[:user_id]) if session[:user_id] 
	end

	def require_user 
  		redirect_to '/login' unless current_user 
	end

	def require_user_registered 
  		redirect_to '/' unless current_user.user_registered? 
	end

	def current_place 
	  @current_place ||= Place.find(session[:place_id]) if session[:place_id] 
	end

	def require_place 
  		redirect_to '/login' unless current_place 
	end

	def require_place_registered 
  		redirect_to '/' unless current_place.place_registered? 
	end

end
