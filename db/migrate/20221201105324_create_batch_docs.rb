class CreateBatchDocs < ActiveRecord::Migration[6.1]
  def change
    create_table :batch_docs do |t|
      t.string :title
      t.integer :status
      t.references :batch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
