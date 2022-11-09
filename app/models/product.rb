class Product < ApplicationRecord
  has_many :batches
  has_many :analyse_supp_docs
  validates :name, presence: true
  has_one_attached :photo
end
