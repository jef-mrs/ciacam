class Product < ApplicationRecord
  has_many :batches
  validates :name, presence: true
  has_one_attached :photo
end
