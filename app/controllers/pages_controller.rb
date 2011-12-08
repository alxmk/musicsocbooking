class PagesController < ApplicationController
  
  def home
    @title = "Home"
  end
  
  def faq
    @title = "Frequently Asked Questions"
  end
  
  private
  
  def check_confirmed
    if !current_user.confirmed?
      flash[:error] = "Only confirmed users may access this area."
      redirect_to root_path
    end
  end
  
end
