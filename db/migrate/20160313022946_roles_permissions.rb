class RolesPermissions < ActiveRecord::Migration
  def change
    create_table :roles_permissions do |t|
      t.references :role, index: true
      t.string :klass, null: false
      t.string :actions, null: false
    end
  end
end
