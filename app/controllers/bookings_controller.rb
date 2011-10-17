class BookingsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :check_confirmed
  
  def create
  end
  
  def destroy
  end
  
  def index
    @title = "Bookings"
    @date = Date.today
  end
  
  private
  
  def check_confirmed
    if !current_user.confirmed?
      flash[:error] = "Only confirmed users may access this area."
      redirect_to home_path
    end
  end
  
end
