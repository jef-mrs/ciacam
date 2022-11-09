class Supplier < ApplicationRecord
  has_many :batches
  has_many :Loading_place
  has_many :documents
  has_many :analyse_supp_docs
  validates :name, :contact, presence: true
end
