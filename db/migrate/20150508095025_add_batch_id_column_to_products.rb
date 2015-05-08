class AddBatchIdColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :batch_id, :integer
    add_column :products, :quantities, :integer
  end
end
