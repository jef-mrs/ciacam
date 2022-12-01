class Document < ApplicationRecord
  belongs_to :batch, optional: true
  belongs_to :supplier, optional: true
  belongs_to :product, optional: true
  has_one_attached :file

  validates :title, :file, presence: true

  SUPPLIER = ['Questionnaire', 'Contact de crise', 'Certificats GFSI']
  BATCH = ['Facture commerciale',

           'Packing list',

           'Bill of Lading',

           'Certificat d’origine',

           'Certificat poids',

           'Certificat qualité',

           'Certificat phyto',

           'Certificat de fumigation',

           'Certificat non OGM',

           'Assurance',

           'Certificate of crop year',

           'Certificate of conformity',

           'Cleanliness statement',

           'Allergens free certificate',

           'No contamination certificate',

           'Certificat France Agrimer',

           'COI']

end
