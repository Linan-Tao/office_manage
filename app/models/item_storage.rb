class ItemStorage < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :purchase
  belongs_to :item, polymorphic: true

  after_create :modify_purchase_arrival_number

  # @materials = nil
  # def item_category_id
  # 	if item_type == "Part"
  # 		Part.find(self.item_id).part_category.id
  # 	elsif item_type == "Material"
  # 		MaterialCategory.find(self.item_id).id
  # 	end
  # end

  # def item_option_id
  # 	if item_type == "Part"
  # 		Part.find(self.item_id).id
  # 	elsif item_type == "Material"
  # 		MaterialType.find(self.item_id).id
  # 	end  	
  # end

  # def item_category_id= (item_category_id)
  # 	if self.item_type == "Material"
  # 		@materials = Material.where(material_category_id: item_category_id)
  # 	end
  # 	if @materials && @materials.size == 1
  # 		self.item_id = @materials.first.id
  # 	end
  # end

  # def item_option_id= (item_option_id)
  # 	if self.item_type == "Part"
  # 		self.item_id = Part.find(item_option_id).id
  # 	elsif self.item_type == "Material"
  # 		@materials = Material.where(material_type_id: item_option_id)
  # 	end

  # 	if @materials && @materials.size == 1
  # 		self.item_id = @materials.first.id
  # 	end
  # end

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

  def modify_purchase_arrival_number
  	purchase = Purchase.find(self.purchase_id)
  	purchase.arrival_number = purchase.arrival_number + self.number
  	purchase.save!
  	# 完全到货后该订单所属的生产单可以领料生产
  	if purchase.arrival_number >= purchase.number
  		pt = purchase.produce_task
  		if pt.work_id == Work.find_by(symbol_name: "purchased").id
  			pt.work_id = Work.find_by(symbol_name: "arrived").id
  			pt.save!
  		end
  	end
  end
end
