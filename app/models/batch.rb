class Batch < ApplicationRecord
  belongs_to :supplier
  belongs_to :product

  validates :number, presence: true
end
