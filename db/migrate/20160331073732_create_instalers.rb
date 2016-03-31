class CreateInstalers < ActiveRecord::Migration
  # 安装工人列表
  def change
    create_table :instalers do |t|
      t.string :name          # 姓名
      t.integer :install_type          # 安装类型
      t.string :phone          # 电话
      t.integer :tech_rank          # 技术级别
      t.integer :serve_rank          # 服务级别
      t.integer :price_rank          # 价格级别
      t.integer :secure_rank          # 安全级别
      t.integer :credit_rank          # 信用级别

      t.timestamps null: false
    end
  end
end
