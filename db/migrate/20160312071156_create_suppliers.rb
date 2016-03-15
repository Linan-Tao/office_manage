class CreateSuppliers < ActiveRecord::Migration
  def change
    # 供货商
    create_table :suppliers do |t|
    	t.string :name
    	t.string :mobile
    	t.string :bank_account #银行账户
    	t.string :address
    	t.string :note
      t.timestamps null: false
    end
  end
end


