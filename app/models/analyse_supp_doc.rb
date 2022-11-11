class AnalyseSuppDoc < ApplicationRecord
  belongs_to :supplier
  belongs_to :product
  has_one_attached :file
end
