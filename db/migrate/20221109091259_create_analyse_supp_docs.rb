class CreateAnalyseSuppDocs < ActiveRecord::Migration[6.1]
  def change
    create_table :analyse_supp_docs do |t|
      t.string :title
      t.references :supplier, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
