class AddColumnsToOrderUnits < ActiveRecord::Migration
  def change
    add_column :order_units, :serial_number, :string
  end
end
