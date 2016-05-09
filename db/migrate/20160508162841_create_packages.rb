class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.references :order, index: true, foreign_key: true
      t.string :order_unit_ids
      t.string :order_part_ids
      t.string :print_size
      t.integer :print_number
    end
  end
end
