class SessionsController < ApplicationController
  def new

    render :new
  end

  def create
    signin_params = params[:session]
    user = User.find_by_email(signin_params[:email].downcase)
    if user && user.authenticate(signin_params[:password])
        sign_in user
    	redirect_to user
    else

    	flash.now[:error] = "Invalid email/password combination"
    	render :new
    end
  end

  def destroy
    sign_out
  	redirect_to root_url
  end
end
