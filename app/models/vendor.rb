class Vendor < ActiveRecord::Base
  attr_accessible :vendor_address, :vendor_name, :product_id, :vendor
  has_many :products

  def getVendorDetails()
  	@vendors = Vendor.all
  end

end
