class Batch < ActiveRecord::Base
  # attr_accessible :arrival_date, :description, :due_date, :name, :order_date, :product, :quantity, :product_ids

  validates_presence_of :name
  # validates_presence_of :products
  validates_uniqueness_of :name

  # has_many :quantities
  # has_many :products#, :through => :quantities
  has_many :batch_products
  has_many :products, :through => :batch_products
  accepts_nested_attributes_for :batch_products

  def to_s
    name
  end


  def arrived?
    arrival_date.nil? ? false : true
  end
end
