class CreateMonthSalaries < ActiveRecord::Migration
  def change
    create_table :month_salaries do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.decimal :total, precision: 8, scale: 2
      t.decimal :extra, precision: 8, scale: 2
      t.decimal :add, precision: 8, scale: 2
      t.decimal :cut, precision: 8, scale: 2
      t.decimal :bonus, precision: 8, scale: 2
      t.decimal :old_age_insurance, precision: 8, scale: 2
      t.decimal :medicare_insurance, precision: 8, scale: 2
      t.decimal :unemployed_insurance, precision: 8, scale: 2
      t.decimal :house_fund, precision: 8, scale: 2
      t.decimal :pre_tax, precision: 8, scale: 2
      t.decimal :income_tax, precision: 8, scale: 2
      t.decimal :actual, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
