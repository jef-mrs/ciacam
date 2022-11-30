class AddColumnBankToBatch < ActiveRecord::Migration[6.1]
  def change
    add_column :batches, :bank, :string
  end
end
