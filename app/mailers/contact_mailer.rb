class ContactMailer < ApplicationMailer
  default to: "carterfotografia@gmail.com"
   default from: "carterfotografia@gmail.com"
  def create_email(contact_params)
    @name = contact_params[:name]
    @reply_email = contact_params[:email]
    @date = contact_params[:date]
    @location = contact_params[:location]
    @message = contact_params[:message]

    mail(subject: "New Site Contact", reply_to: @reply_email)
  end
end
