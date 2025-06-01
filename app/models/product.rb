class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, :description, :price, :image, presence: true
end
