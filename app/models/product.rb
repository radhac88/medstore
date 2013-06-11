class Product < ActiveRecord::Base
  attr_accessible :batch_number, :cost_price, :expired_on, :manufactured_on, :name, :vendor_id
end
