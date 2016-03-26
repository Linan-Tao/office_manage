class CreateOutStorages < ActiveRecord::Migration
  def change
    create_table :out_storages do |t|
      t.datetime :out_date
      t.references :department, index: true, foreign_key: true
      t.string :out_user
      t.references :produce_task, index: true, foreign_key: true
      t.integer :item_id
      t.string :item_type
      t.string :number
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
