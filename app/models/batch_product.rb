class BatchProduct < ActiveRecord::Base
  # attr_accessible :batch_id, :product_id
	belongs_to :batch
	belongs_to :product
end
