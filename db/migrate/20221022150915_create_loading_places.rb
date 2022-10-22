class CreateLoadingPlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :loading_places do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
