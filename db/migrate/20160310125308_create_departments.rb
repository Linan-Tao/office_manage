class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
    	t.string  :name, null: false
    	t.integer :manager_id #部门经理
    	t.integer :number    #部门人数
    	t.text     :desc       #部门的职能描述
      t.timestamps null: false
    end

    add_index(:departments, :manager_id)
  end
end