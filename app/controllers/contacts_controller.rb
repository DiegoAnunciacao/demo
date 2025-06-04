class ContactsController < ApplicationController
  def create
    @contact = Contact.new(email_params)
    if @contact.valid?
      ContactMailer.create_email(email_params).deliver_now
      redirect_to root_path, notice: "Message Successful delivered"
    else
       Rails.logger.info "Contact validation errors: #{@contact.errors.full_messages.join(', ')}"
      flash.now[:alert] = "Please fix the errors below"
      render "pages/contact"
    end
  end

  private

  def email_params
    params.require(:contact).permit(:name, :email, :date, :location, :message)
  end
end
