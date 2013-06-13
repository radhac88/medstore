class ChangeColumnNamesProducts < ActiveRecord::Migration
  def up
  	rename_column :products, :batch_number, :btch_no
  	rename_column :products, :manufactured_on, :mfd_on
  	rename_column :products, :name, :product_name
  end

  def down
  end
end
