class ChangeColumnTypeVendor < ActiveRecord::Migration
  def up
  	change_column :products, :vendor, :string
  end

  def down
  end
end
