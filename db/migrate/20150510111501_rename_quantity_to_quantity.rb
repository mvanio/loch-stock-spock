class RenameQuantityToQuantity < ActiveRecord::Migration
  def up
  	rename_column :quantities, :quantity, :p_quantity
  	rename_column :quantities, :batch_id, :batch_product_id
  end

  def down
  	rename_column :quantities, :p_quantity, :quantity
  	rename_column :quantities, :batch_product_id, :batch_id
  end
end
