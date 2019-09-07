class PlaceMailer < ApplicationMailer
  def send_me
    user = params[:user]
    @place = params[:place]
    mail(to: user.email, subject: "Lugar: #{t @place.description}")
  end
end
