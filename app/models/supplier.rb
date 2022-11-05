class Supplier < ApplicationRecord
  has_many :batches
  has_many :Loading_place
  has_many :documents
  validates :name, :contact, presence: true
end
