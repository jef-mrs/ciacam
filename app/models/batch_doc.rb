class BatchDoc < ApplicationRecord
  belongs_to :batch
  validates_uniqueness_of :title, scope: :batch

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

           'Allergens free certif',

           'No contamination certificate',

           'Certificat France Agrimer',

           'COI']
end
