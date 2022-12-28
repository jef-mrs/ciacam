class Product < ApplicationRecord
  has_many :batches, dependent: :destroy
  has_many :analyse_supp_docs, dependent: :destroy
  has_many :documents, dependent: :destroy
  validates :name, presence: true
  has_one_attached :photo
end
