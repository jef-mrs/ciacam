class AnalyseSuppDoc < ApplicationRecord
  belongs_to :supplier
  belongs_to :product
  has_many_attached :file
end
