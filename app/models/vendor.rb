class Vendor < ActiveRecord::Base
  attr_accessible :vendor_address, :vendor_name
  has_and_belongs_to_many :products
end
