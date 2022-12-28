class Supplier < ApplicationRecord
  has_many :batches, dependent: :destroy
  has_many :Loading_place, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :analyse_supp_docs, dependent: :destroy
  validates :name, presence: true
end
