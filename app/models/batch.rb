class Batch < ApplicationRecord
  belongs_to :supplier
  belongs_to :product
  has_many :documents, dependent: :destroy
  has_many :batch_docs, dependent: :destroy

  validates :number, presence: true

  after_create do
    create_batch_doc if transportation == 2
  end

  STATUS = [[0, "Copie reçu"],
            [1, "Doc en banque"],
            [2, "Payé"],
            [3, "Docs envoyé par la banque"],
            [4, "Docs originaux reçu"],
            [5, "Bl envoyé ou déposé à la compagnie"]]

  private

  def create_batch_doc
    BatchDoc::BATCH.each do |title|
      BatchDoc.create(title: title, status: 2, batch: self)
    end
  end
end
