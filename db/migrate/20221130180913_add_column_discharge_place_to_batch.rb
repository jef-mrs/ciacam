class AddColumnDischargePlaceToBatch < ActiveRecord::Migration[6.1]
  def change
    add_column :batches, :discharge_place, :string
  end
end
