class BookingsController < ApplicationController
  before_action :set_location, only: [:new, :create]

  def update
    if params[:commit] == "Accept"
      @booking = Booking.find(params[:id])
      @booking.status = 1
    elsif params[:commit] == "Reject"
      @booking = Booking.find(params[:id])
      @booking.status = 2
    end
    @booking.save
    authorize @booking
    redirect_to dashboard_path
  end



  def new
    @booking = Booking.new
    start_date = Time.zone.today.beginning_of_month
    end_date = (start_date + 1.month).end_of_month
    @available_dates = @location.available_dates(start_date, end_date)
  end

  def create
    dates = params[:booking][:dates].split(', ') if params.dig(:booking, :dates)
    @booking = Booking.new
    @booking.user = current_user
    @booking.location = @location
    @booking.dates = dates || []
    @booking.amount =  (@booking.dates.length * @location.price)
    @booking.status = 0
    if @booking.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @booking.location.name,
          # images: @booking.location.photos,
          amount: @booking.amount_cents,
          currency: 'eur',
          quantity: 1
        }],
        success_url: location_booking_confirmation_payment_url(@booking.location, @booking),
        cancel_url: root_url
      )

      @booking.update(checkout_session_id: session.id)
      redirect_to location_booking_confirmation_path(@booking.id, @booking)
    else
      render 'locations/show'
    end



    def confirmation
      # @location = Location.find(params[:location_id])
      @booking = Booking.find(params[:booking_id])
      # authorize @location
      authorize @booking
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  private

  def set_location
    @location = Location.find(params[:location_id])
    authorize @location
  end
end
