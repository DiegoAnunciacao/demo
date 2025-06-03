class ContactMailer < ApplicationMailer
  default to: "carterfotografia@gmail.com"
  def create_email(contact_params)
    @name = contact_params[:name]
    @email = contact_params[:email]
    @date = contact_params[:date]
    @location = contact_params[:location]
    @message = contact_params[:message]

    mail(from: @email, subject: "New Site Contact")
  end
end
