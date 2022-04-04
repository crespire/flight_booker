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
      redirect_to booking_path(@booking), notice: 'Booking created!'
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger).confirm_booking.deliver_now!
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.includes(:flight, flight: :destination).find(params[:id])
  end

  private

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:flight_id, :num_tickets, passengers_attributes: %i[name email])
  end
end
