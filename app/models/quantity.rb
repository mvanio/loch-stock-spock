class Quantity < ActiveRecord::Base
  attr_accessible :batch_id, :product_id, :quantity

  belongs_to :product
  belongs_to :batch

  accepts_nested_attributes_for :product

end
