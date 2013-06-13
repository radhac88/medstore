class Product < ActiveRecord::Base
  attr_accessible :btch_no, :cost_price, :expired_on, :mfd_on, :product_name, :vendor, :vendor_id
  has_and_belongs_to_many :vendors
end
