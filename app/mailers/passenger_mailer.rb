class PassengerMailer < ApplicationMailer
  default from: "test@flightbooker_local"

  def confirm_booking
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: 'Flight confirmed!')
  end
end
