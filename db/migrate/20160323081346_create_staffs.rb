class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.references :department, index: true, foreign_key: true
      t.string :id_card
      t.decimal :base_salary, precision: 8, scale: 2
      t.decimal :old_age_insurance, precision: 8, scale: 2
      t.decimal :medicare_insurance, precision: 8, scale: 2
      t.decimal :unemployed_insurance, precision: 8, scale: 2
      t.decimal :house_fund, precision: 8, scale: 2
      t.integer :status

      t.timestamps null: false
    end
  end
end
