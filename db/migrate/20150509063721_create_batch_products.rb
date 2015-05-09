class CreateBatchProducts < ActiveRecord::Migration
  def change
    create_table :batch_products do |t|
      t.integer :batch_id
      t.integer :product_id

      t.timestamps
    end
  end
end
