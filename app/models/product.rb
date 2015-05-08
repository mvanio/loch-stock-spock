class Product < ActiveRecord::Base
  # attr_accessible :description, :sku

  # has_many :quantities
  # has_many :batches, :through => :quantities

  # accepts_nested_attributes_for :quantities
  belongs_to :batch

  def to_s
    sku + " - " + description
  end


end
