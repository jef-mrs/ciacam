class Document < ApplicationRecord
  belongs_to :batch, optional: true
  belongs_to :supplier, optional: true

  validates :title, presence: true
end
