class Contact
  include ActiveModel::Model
  attr_accessor :name, :email, :date, :location, :message
  validates :name, :email, :date, :location, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
