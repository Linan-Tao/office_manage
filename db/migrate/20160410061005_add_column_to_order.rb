class AddColumnToOrder < ActiveRecord::Migration
  def change
  	add_reference :orders, :order_union, index: true, foreign_key: true
  	add_column :orders, :number, :integer
  end
end
