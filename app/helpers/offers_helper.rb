module OffersHelper
  def create_offer(order_union)
    order_union.offers.destroy_all
    orders = order_union.orders
    orders.each do |order|
      order.order_units.each do |unit|
        material = Material.find_by(ply: unit.ply, texture: (unit.texture || order.texture), face: (unit.face || order.face), color: (unit.color || order.color))
        unless material
          order_union.offers.destroy_all
          return '生成报价单错误！未查到 "仓储信息 -- 板料"，请联系管理员！'
        end
        offer = Offer.find_or_create_by(order_union_id: order_union.id, order_id: order.id, item_id: material.id)
        offer.price = material.sell.to_f
        size = unit.size.split(/[xX*]/).map(&:to_i)
        offer.number = offer.number.to_f + ((unit.number.to_f * size[0] * size[1])/(1000*1000))
        offer.total = offer.price * offer.number
        mc_ids = [material.ply, material.texture, material.face, material.color]
        offer.item_name = MaterialCategory.where(id: mc_ids).map(&:name).join("-")
        offer.item_type = material.class
        offer.save
      end

      order.order_parts.each do |order_part|
        part = order_part.part
        offer_p = Offer.find_or_create_by(item_id: part.id, item_type: part.class, order_union_id: order_union.id, order_id: order.id)
        offer_p.number = offer_p.number.to_i + order_part.number.to_i
        offer_p.price = part.sell.to_f
        offer_p.total = offer_p.price * offer_p.number
        offer_p.item_name = part.name
        offer_p.category = part.part_category.name
        offer_p.save
      end

      order.labor_costs.each do |cost|
        offer_p = Offer.find_or_create_by(item_id: cost.id, item_type: cost.class, order_union_id: order_union.id, order_id: order.id)
        offer_p.number = offer_p.number.to_i + cost.number.to_i
        offer_p.price = cost.price
        offer_p.total = offer_p.price * offer_p.number
        offer_p.item_name = cost.item
        offer_p.save
      end
        order.offered!
        order.offer_time = Time.now()
        order.save!
    end
    order_union.offered!
  end
end
