class ChangeNullOnBatchId < ActiveRecord::Migration[6.1]
  def change
    change_column_null :documents, :batch_id, true
  end
end
