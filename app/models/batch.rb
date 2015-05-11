class Batch < ActiveRecord::Base
  # attr_accessible :arrival_date, :description, :due_date, :name, :order_date, :product, :quantity, :product_ids

  validates_presence_of :name
  # validates_presence_of :products
  validates_uniqueness_of :name

  # has_many :quantities
  # has_many :products#, :through => :quantities
  has_many :batch_products
  has_many :products, :through => :batch_products
  accepts_nested_attributes_for :batch_products#, :reject_if => lambda { |a| a[:product_id].blank? }
  after_save :delete_blank_product

  def delete_blank_product
    self.batch_products.where(:product_id =>  nil).delete_all
  end

  def to_s
    name
  end


  def arrived?
    arrival_date.nil? ? false : true
  end
end
