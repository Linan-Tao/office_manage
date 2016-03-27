class ChangeColumnPurchases < ActiveRecord::Migration
  def change
  	remove_column :purchases, :original_code
  	add_reference :purchases, :produce_task, index: true, foreign_key: true #生产任务
  end
end
