class Batch < ActiveRecord::Base
  # attr_accessible :arrival_date, :description, :due_date, :name, :order_date, :product, :quantity, :product_ids

  validates_presence_of :name
  validates_presence_of :products
  validates_uniqueness_of :name

  # has_many :quantities
  has_many :products#, :through => :quantities

  accepts_nested_attributes_for :products#, :quantities

  def to_s
    name
  end


  def arrived?
    arrival_date.nil? ? false : true
  end
end
