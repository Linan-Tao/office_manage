class CreateLogisticProviders < ActiveRecord::Migration
  # 物流商
  def change
    create_table :logistic_providers do |t|
      t.string :name      # 物流商
      t.string :director      # 负责任
      t.string :address      # 地址
      t.string :phone      # 电话
      t.string :qq      # qq
      t.string :delivery_way      # 发货方式
      t.integer :arrival_cycle      # 到货周期
      t.integer :serve_rank      # 服务级别
      t.integer :price_rank      # 价格级别
      t.integer :secure_rank      # 安全级别
      t.integer :credit_rank      # 信用级别

      t.timestamps null: false
    end
  end
end
