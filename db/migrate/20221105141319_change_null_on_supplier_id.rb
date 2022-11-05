class ChangeNullOnSupplierId < ActiveRecord::Migration[6.1]
  def change
    change_column_null :documents, :supplier_id, true
  end
end
