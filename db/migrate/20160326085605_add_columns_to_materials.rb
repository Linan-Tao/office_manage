class AddColumnsToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :applied_number, :integer
  end
end
