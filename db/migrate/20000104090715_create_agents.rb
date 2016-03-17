class CreateAgents < ActiveRecord::Migration
  def change
    # 代理商、经销商
    create_table :agents do |t|
      t.string :code # 代理商、经销商编号
      t.references :province # 省
      t.references :city # 市
      t.references :district # 县
      t.string :address # 地址
      t.string :name, index: true # 经销商名称,需要查询
      t.string :principal # 负责人姓名
      t.string :mobile # 手机
      t.string :e_account # 电子账号QQ
      t.string :fax # 传真
      t.string :email # 邮箱
      t.string :wechar # 微信
      t.string :logistics # 指定物流
      t.integer :order_condition # 下单条件
      t.integer :send_condition # 发货条件
      t.string :pay_cycle # 结账周期（天）
      t.timestamps null: false
    end
  end
end
