class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :terminal, :string, limit: 1024
    add_column :orders, :ply, :integer
    add_column :orders, :texture, :integer
    add_column :orders, :face, :integer
  end
end
