class ProfessionalMailer < ApplicationMailer
  def send_me
    user = params[:user]
    @professional = params[:professional]
    mail(to: user.email, subject: "Profissional: #{@professional.user.name}")
  end
end
