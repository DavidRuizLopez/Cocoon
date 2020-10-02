class HotelsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_hotel, only: [:show]

  def show
    @booking = Booking.new
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:format])
  end
end
