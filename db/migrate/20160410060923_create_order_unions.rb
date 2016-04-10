class CreateOrderUnions < ActiveRecord::Migration
  def change
    create_table :order_unions do |t|
      t.string :code, unique: true
      t.references :agent, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
