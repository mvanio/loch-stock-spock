class BatchProduct < ActiveRecord::Base
  # attr_accessible :batch_id, :product_id
	belongs_to :batch
	belongs_to :product
	has_one :quantity
	accepts_nested_attributes_for :quantity, :reject_if => lambda { |a| a[:p_quantity].blank? }
end
