class AddColumnInfoToBatch < ActiveRecord::Migration[6.1]
  def change
    add_column :batches, :info, :text
  end
end
