class SessionsUserController < ApplicationController
	def new
		
	end

	def create
        @user = User.find_by_email(params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          redirect_to '/login_user'
        end 
	end

	def destroy 
  		session[:user_id] = nil 
  		redirect_to '/' 
	end
end