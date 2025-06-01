class ContactsController < ApplicationController
  def create
    ContactMailer.contact_email(contact_params).deliver_now
    redirect_to pages_root_path, notice: "Message Successful sent"
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :date, :location, :message)
  end
end
