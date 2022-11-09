class AddColumnBioToSupplier < ActiveRecord::Migration[6.1]
  def change
    add_column :suppliers, :bio, :boolean
  end
end
