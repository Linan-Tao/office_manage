module OrdersHelper
	# 导入拆单文件
  def import_order_units(file, order_code)
    table = CSV.read(file.path, {:headers => true, :encoding => 'GB18030:UTF-8'})
    headers = table.headers[0..15].map(&:strip)
    if headers == ["部件名称", "板材", "长", "宽", "厚", "数量", "裁切尺寸", "柜体名称", "订单号", "订货商", "终端信息", "封边", "纹理", "备注", "条码", "流水号"]
      order = Order.find_by(order_code: order_code)
      # 拆单文件中的订单号
      order_units_order_code = table.map{|r| r[8]}.uniq.join(',')
      if order &&  order_units_order_code == order_code
        ActiveRecord::Base.transaction do
          OrderUnit.where(order_id: order.id).destroy_all
          table.each do |row|
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
          order.separated!
        end
        return "订单已经拆单成功！"
      else
        return "请导入与该订单#{order_code}相对应的拆单文件，您导入的订单号是:#{order_units_order_code}请检查!"
      end
    else
      return "文件头不正确，请检查是否是:#{headers}.to_s"
    end
  end

# {"utf8"=>"✓",
#  "_method"=>"patch",
#  "authenticity_token"=>"5ak41PEtRCnZhC0MgD5y+7XIuVUElBaVmTfonZQEkq13qbH1EBL3jbxOq7O45luH8zLQaJWPQ9kn12pVNTr8vg==",
#  "order_union"=>
#   {"type"=>"offer",
#    "offers_attributes"=>
#     {"1458391474448"=>{"material_category_id"=>"1", "material_type_id"=>"1", "number"=>"1", "_destroy"=>"false"},
#      "1458391475207"=>{"material_category_id"=>"2", "material_type_id"=>"4", "number"=>"2", "_destroy"=>"false"},
#      "1458391475936"=>{"material_category_id"=>"3", "material_type_id"=>"3", "number"=>"2", "_destroy"=>"false"}}},
#  "item"=>"加工费",
#  "item_number"=>"2",
#  "item_price"=>"12",
#  "commit"=>"保存",
#  "controller"=>"orders",
#  "action"=>"update",
#  "id"=>"1"}
# 创建报价单
  def import_offers(offers_params)
    order_union = OrderUnion.find(offers_params[:id])
    ActiveRecord::Base.transaction do
      # 板料
      if offers_params[:order_union] && offers_params[:order_union][:offers_attributes]
        offers_params[:order_union][:offers_attributes].values.each do |offer|
          next unless offer[:_destroy] == "false"
          material = Material.find_by(ply: offer[:ply], texture: offer[:texture], face: offer[:face], color: offer[:color])
          return '生成报价单错误！未查到物料信息，请联系管理员！' unless material
          offer_m = order_union.offers.find_or_create_by(item_id: material.id, item_type: material.class)
          offer_m.price = material.sell.to_f
          offer_m.number = offer[:number].to_f
          offer_m.total = offer_m.price * offer_m.number
          mc_ids = [material.ply, material.texture, material.face, material.color]
          offer_m.item_name = MaterialCategory.where(id: mc_ids).map(&:name).join("-")
          # 删除 material_type
          #offer_m.category = material.material_type.name
          offer_m.save
        end
      end
      # 配件
      order_union.orders.map(&:order_parts).flatten.each do |order_part|
        part = order_part.part
        offer_p = order_union.offers.find_or_create_by(item_id: part.id, item_type: part.class)
        offer_p.number = offer_p.number.to_i + order_part.number.to_i
        offer_p.price = part.sell.to_f
        offer_p.total = offer_p.price * offer_p.number
        offer_p.item_name = part.name
        offer_p.category = part.part_category.name
        offer_p.save
      end
      # 人工费
      if offers_params[:item].present? &&  offers_params[:item_price].present?
        offer_r = order_union.offers.new
        offer_r.item_name = offers_params[:item]
        offer_r.price = offers_params[:item_price].to_f
        offer_r.number = offers_params[:item_number].to_i
        offer_r.total = offer_r.price * offer_r.number
        offer_r.save
      end
      order_union.orders.each do |order|
        order.offered!
        order.offer_time = Time.now()
        order.save!
      end
      return "报价单创建成功"
    end
  end
end
