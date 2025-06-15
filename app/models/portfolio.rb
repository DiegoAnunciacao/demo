class Portfolio < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  # validates :photos, presence: true
end
