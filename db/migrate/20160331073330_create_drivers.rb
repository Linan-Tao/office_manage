class CreateDrivers < ActiveRecord::Migration
  # 司机列表
  def change
    create_table :drivers do |t|
      t.string :name       # 司机名称
      t.integer :car_type       # 车型
      t.string :car_code       # 车牌号
      t.string :phone       # 电话
      t.integer :serve_rank       # 服务级别
      t.integer :price_rank       # 价格级别
      t.integer :secure_rank       # 安全级别
      t.integer :credit_rank       # 信用级别

      t.timestamps null: false
    end
  end
end
