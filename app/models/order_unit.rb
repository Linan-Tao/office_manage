class OrderUnit < ActiveRecord::Base
  has_one :produce_tasks, as: :item

  def self.import(file)
  	return_hash = {}
  	return_hash[:status] == 'ok'
  	order_id = nil
  	# 部件名称0,板材1,长2,宽3,厚4,数量5,裁切尺寸6,柜体名称7,订单号8,订货商9,终端信息10,封边11,纹理12,备注13,条码14,流水号15
    CSV.foreach(file.path, {:headers => false, :encoding => 'GB18030:UTF-8'}) do |row|
    	next if row[8] == '订单号'
    	order = Order.find_by(order_code: row[8])
    	unless order
    	  return_hash[:status] = 'error'
    	  return_hash[:error_message] = "订单号#{row[8]}不存在"
    	  return return_hash
    	end
    	order_id = order.id
    	unless order.status == "not_separate"
    	  return_hash[:status] = 'error'
    	  return_hash[:error_message] = "订单号#{row[8]}已经拆单"
    	  return return_hash   		
    	end
        record = OrderUnit.new(
            :order_id   => order.id, 
            :unit_name => row[0],
            :name => row[1],
            :lenght => row[2],
            :width => row[3],
            :thick => row[4],
            :number => row[5],
            :size => row[6],
            :edge => row[11],
            :texture => row[12],
            :note => row[13]
        )
        record.save!
    end
    return_hash[:status] = 'ok'
    return_hash[:order_id] = order_id
    order = Order.find(order_id)
    order.separated!
    return_hash
  end
end
