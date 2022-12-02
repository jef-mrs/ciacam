class AddColumnOriginToBatch < ActiveRecord::Migration[6.1]
  def change
    add_column :batches, :origin, :string
  end
end
