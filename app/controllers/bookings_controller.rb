class BookingsController < ApplicationController
  def new
    @flight = Flight.includes(:origin, :destination).find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:num_tickets].to_i.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.new(booking_params)

    if @booking.save
      redirect_to :root, notice: 'Booking created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:flight_id, :num_tickets, passengers_attributes: %i[name email])
  end
end
