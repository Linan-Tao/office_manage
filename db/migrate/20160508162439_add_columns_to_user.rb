class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :default_print_size, :string
  end
end
