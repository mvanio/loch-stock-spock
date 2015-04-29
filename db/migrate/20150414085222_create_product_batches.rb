class CreateProductBatches < ActiveRecord::Migration
  def change
    create_table :product_batches do |t|
      t.integer :batch_id
      t.integer :product_id
      t.integer :quantity
      t.timestamps
    end
  end
end
