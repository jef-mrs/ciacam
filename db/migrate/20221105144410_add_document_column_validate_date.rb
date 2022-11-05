class AddDocumentColumnValidateDate < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :validate_date, :datetime
  end
end
