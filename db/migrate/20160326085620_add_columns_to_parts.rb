class AddColumnsToParts < ActiveRecord::Migration
  def change
    add_column :parts, :applied_number, :integer
  end
end
