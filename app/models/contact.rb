class Contact
  include ActiveModel::Model
  attr_accessor :name, :email, :date, :location, :message
  validates :name, :email, :date, :location, :message, presence: true
end
