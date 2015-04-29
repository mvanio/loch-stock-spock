class RenameProductBatchToQuantities < ActiveRecord::Migration
  def up
    rename_table :product_batches, :quantities
  end

  def down
    rename_table :quantities, :product_batches
  end

end
