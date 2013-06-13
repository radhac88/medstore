class ChangeColumnNameVendorId < ActiveRecord::Migration
  def up
  	rename_column :products, :vendor_id, :vendor
  end

  def down
  end
end
