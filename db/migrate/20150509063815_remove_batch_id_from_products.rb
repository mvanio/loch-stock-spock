class RemoveBatchIdFromProducts < ActiveRecord::Migration
  def up
  	remove_column :products, :batch_id
  end

  def down
  	add_column :products, :batch_id, :integer
  end
end
