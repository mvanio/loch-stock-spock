class Product < ActiveRecord::Base
  # attr_accessible :description, :sku

  has_many :batch_products
  has_many :batches, :through => :batch_products
  accepts_nested_attributes_for :batch_products
  # accepts_nested_attributes_for :quantities
  # belongs_to :batch

  def to_s
    sku + " - " + description
  end


end
