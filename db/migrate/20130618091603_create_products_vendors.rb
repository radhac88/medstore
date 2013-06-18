class CreateProductsVendors < ActiveRecord::Migration
  def change
    create_table :products_vendors, :id => false do |t|
      t.integer :product_id
      t.integer :vendor_id

      #t.timestamps
    end
  end
end


