class Pizza < ActiveRecord::Base
  attr_accessible :order, :size, :toppings 
  
  belongs_to :order
end
