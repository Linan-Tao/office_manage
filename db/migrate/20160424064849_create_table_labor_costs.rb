class CreateTableLaborCosts < ActiveRecord::Migration
  def change
    create_table :labor_costs do |t|
      t.references :order, index: true, foreign_key: true
      t.integer    :number, null: false #数量
      t.string     :item #人工费说明
      t.decimal     :price, precision: 8, scale: 2, null: false #价格
      t.references :user #录入人
      t.timestamps null: false
    end
  end
end
