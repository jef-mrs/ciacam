class RenameBatchToBatche < ActiveRecord::Migration[6.1]
  def change
    rename_table :batches, :batchs
  end
end
