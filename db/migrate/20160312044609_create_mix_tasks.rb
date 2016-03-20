class CreateMixTasks < ActiveRecord::Migration
  # 混单表
  def change
    create_table :mix_tasks do |t|
      t.integer :number       #混单后需要的大板数量
      t.decimal :availability, precision: 8, scale: 2 #混单后原料利用率
      t.string :file_path          #混单文件的路径

      t.timestamps null: false
    end
  end
end
