class AddCloumnsToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :checker, :string #审核人
    add_column :purchases, :check_status, :integer #审核状态
    add_column :purchases, :check_date, :datetime # 审核日期
    add_reference :purchases, :supplier, index: true, foreign_key: true #供应商
  end
end
