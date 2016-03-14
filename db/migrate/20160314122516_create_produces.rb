class CreateProduces < ActiveRecord::Migration
	#生产单
  def change
    create_table :produces do |t|
    	t.references :material, index: true, foreign_key: true
    	t.integer :number
			t.decimal :use_rate, precision: 8, scale: 2 #大板利用率
			t.references :work, index: true, foreign_key: true
			t.string :file_path #设计图地址
			t.references :user, index: true, foreign_key:true
      t.timestamps null: false
    end
  end
end
