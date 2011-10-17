class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :check_admin
  
  def index
    @title = "User List"
    @users = User.all
  end
  
  def confirm
    @user = User.find(params[:id])
    if !@user.confirmed?
      @user.toggle!(:confirmed)
    end
    flash[:success] = "User #{@user.email} confirmed!"
    redirect_to users_path
  end
  
  def unconfirm
    @user = User.find(params[:id])
    if @user.confirmed?
      @user.toggle!(:confirmed)
    end
    flash[:success] = "User #{@user.email} unconfirmed!"
    redirect_to users_path
  end
  
  private
  
  def check_admin
    if !current_user.admin?
      flash[:error] = "Only confirmed site admins may access this area."
      redirect_to home_path
    end
  end
  
end
