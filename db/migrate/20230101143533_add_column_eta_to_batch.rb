class AddColumnEtaToBatch < ActiveRecord::Migration[6.1]
  def change
    add_column :batches, :eta, :date
  end
end
