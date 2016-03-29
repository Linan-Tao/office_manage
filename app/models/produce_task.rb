class ProduceTask < ActiveRecord::Base
  # belongs_to :order
  belongs_to :item, polymorphic: true
  belongs_to :mix_task
  belongs_to :work
  has_many :order_parts
  has_many :order_units
  has_one :purchase, dependent: :destroy


  after_create :create_purchase

  def item_name
  	 if item_type == "Material"
  	 	 item.material_category.name
  	 elsif item_type == "Part"
  	 	 item.name
  	 end
  end

  def item_category
  	if item_type == "Material"
  	  item.material_type.name
  	elsif item_type == "Part"
  	  item.part_category.name
  	end
  end

  def create_purchase
    # 判断仓库里有没有足够的库存，如果有就不需要采购
    available_number = self.item.number.to_i - self.item.applied_number.to_i
    if available_number >= self.number
      self.item.applied_number = self.item.applied_number.to_i + self.number.to_i
      self.item.save!
    else
      purchase_number = self.number - available_number
      self.item.applied_number = self.item.applied_number.to_i + available_number
      self.item.save!

      pur =  self.build_purchase
      pur.item_id = self.item_id
      pur.item_type = self.item_type
      pur.number = purchase_number
      pur.price  = self.item.price
      pur.payable = pur.number.to_i * pur.price.to_f
      pur.check_status = 0
      pur.save!
    end
  end
end
