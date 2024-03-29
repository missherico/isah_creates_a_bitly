class UsersController < ApplicationController
  def new
    @user = User.new

  end

  def show
    @user = User.find(params[:id])

  end

  def create
    @user = User.new(user_params)
    if @user.save
    	flash[:success] = "Let's get to saving these links for later."
        sign_in @user
        redirect_to @user
    else
    	render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    render :show
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
