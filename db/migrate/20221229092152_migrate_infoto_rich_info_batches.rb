class MigrateInfotoRichInfoBatches < ActiveRecord::Migration[6.1]
  def up
    Batch.find_each do |batch|
      batch.update(rich_info: batch.info)
    end
  end

  def down
    Batch.find_each do |batch|
      batch.update(info: batch.rich_info)
      batch.update(rich_info: nil)
    end
  end
end
