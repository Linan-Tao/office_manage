class Roles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, limit: 32, null: false, index: true, uniq: true
      t.string :key, limit: 32, null: false, index: true, uniq: true
      t.timestamps null: false
    end
  end
end
