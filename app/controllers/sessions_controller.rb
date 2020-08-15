class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params.dig(:session, :email).downcase)

		unless @user
			flash.now[:alert] = 'Invalid email'
			render :new
		else
			if @user.authenticate(params.dig(:session, :password))
				flash[:notice] = 'Successfully logged in!'
				session[:user_id] = @user.id
				redirect_to @user
			else
				flash.now[:alert] = 'Invalid password'
				render :new
			end
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = 'Successfully logged out'
		redirect_to root_path
	end
end
