class Product < ApplicationRecord
  has_many :batches
  validates :name, presence: true
end
