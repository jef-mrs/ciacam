class AddColumnStatusToBatch < ActiveRecord::Migration[6.1]
  def change
    add_column :batches, :status, :integer
  end
end
