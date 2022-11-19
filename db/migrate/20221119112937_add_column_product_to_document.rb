class AddColumnProductToDocument < ActiveRecord::Migration[6.1]
  def change
    add_reference :documents, :product, null: true, foreign_key: true
  end
end
