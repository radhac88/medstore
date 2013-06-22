class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :btch_no
      t.integer :vendor_id
      t.date :mfd_on
      t.date :expired_on
      t.float :cost_price

      t.timestamps
    end
  end
end
