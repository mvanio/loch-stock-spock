class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :name
      t.date :due_date
      t.string :description
      t.date :order_date
      t.date :arrival_date

      t.timestamps
    end
  end
end
