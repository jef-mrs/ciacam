class Document < ApplicationRecord
  belongs_to :batch, optional: true
  belongs_to :supplier, optional: true
  has_one_attached :file

  validates :title, :file, presence: true

  SUPPLIER = ['Questionnaire', 'Contact de crise']
end
