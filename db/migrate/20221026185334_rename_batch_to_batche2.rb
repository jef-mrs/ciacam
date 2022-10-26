class RenameBatchToBatche2 < ActiveRecord::Migration[6.1]
  def change
    rename_table :batchs, :batches
  end
end
