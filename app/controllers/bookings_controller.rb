class BookingsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :check_confirmed
  
  def make
    if current_user.already_booked?
      flash[:error] = "You've already booked a session this week!"
      redirect_to bookings_path
    else
      @booking = current_user.bookings.build
      @booking.booking_time = params[:booking_time]
      if @booking.save
        flash[:success] = "Booking made!"
        redirect_to bookings_path
      else
        flash[:error] = "Something went wrong :( contact the MusicSoc committee asap!"
        redirect_to bookings_path
      end
    end
  end
  
  def remove
    @booking = Booking.find(params[:id])
    if @booking.destroy
      flash[:success] = "Booking removed!"
      redirect_to bookings_path
    else
      flash[:error] = "Something went wrong :( contact the MusicSoc committee asap!"
      redirect_to bookings_path
    end
  end
  
  def index
    @title = "Bookings"
    @date = Date.today
  end
  
  private
  
  def check_confirmed
    if !current_user.confirmed?
      flash[:error] = "Only confirmed users may access this area."
      redirect_to root_path
    end
  end
  
end
