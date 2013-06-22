class Product < ActiveRecord::Base
  attr_accessible :btch_no, :cost_price, :expired_on, :mfd_on, :product_name, :vendor, :vendor_id, :vendor_name, :product, :remain_days, :created_at, :updated_at
  belongs_to :vendor
end
