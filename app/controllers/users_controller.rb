class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :check_admin
  
  def index
    @title = "User List"
    @users = User.all
  end
  
  private
  
  def check_admin
    if !current_user.admin?
      flash[:error] = "Only confirmed site admins may access this area."
      redirect_to home_path
    end
  end
  
end
