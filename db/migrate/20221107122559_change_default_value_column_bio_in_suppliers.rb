class ChangeDefaultValueColumnBioInSuppliers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :suppliers, :bio, false
  end
end
