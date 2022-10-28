class Supplier < ApplicationRecord
  has_many :batches
  has_many :Loading_place
  validates :name, :contact, presence: true
end
