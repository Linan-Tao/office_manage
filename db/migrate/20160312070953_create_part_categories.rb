class CreatePartCategories < ActiveRecord::Migration
  def change
    create_table :part_categories do |t|
    	t.string :name
    	t.string :note
      t.timestamps null: false
    end
  end
end
