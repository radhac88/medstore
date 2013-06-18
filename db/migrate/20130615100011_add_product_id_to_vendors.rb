class AddProductIdToVendors < ActiveRecord::Migration
  def change
  	add_column :vendors, :product_id, :integer
  	add_index :vendors, :product_id
  end
end
