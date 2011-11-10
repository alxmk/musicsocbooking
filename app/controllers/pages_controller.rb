class PagesController < ApplicationController
  
  before_filter :authenticate_user!,  :only => :faq
  before_filter :check_confirmed,     :only => :faq
  
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
