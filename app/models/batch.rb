class Batch < ApplicationRecord
  belongs_to :supplier
  belongs_to :product
  has_many :documents

  validates :number, presence: true
end
