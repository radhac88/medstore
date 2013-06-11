class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :batch_number
      t.integer :vendor_id
      t.date :manufactured_on
      t.date :expired_on
      t.float :cost_price

     # t.timestamps
    end
  end
end
