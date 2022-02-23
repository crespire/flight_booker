class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    @depart_dates = Flight.all.collect(&:depart_date).sort.uniq
    @airports = Airport.all
    return unless params[:origin].present?

    @results = Flight.joins(:origin, :destination).where(origin: { code: params[:origin] }, destination: { code: params[:destination] }).where(depart_date: params[:departure_date])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:name, :depart_time, :flight_duration, :origin_airport_id, :destination_airport_id)
    end
end
