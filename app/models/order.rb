class Order < ActiveRecord::Base
  attr_accessible :customer_name, :pizzas_attributes 
  has_many :pizzas
  accepts_nested_attributes_for :pizzas, :allow_destroy => true
end
