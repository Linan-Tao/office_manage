class ProduceTask < ActiveRecord::Base
  belongs_to :order
  belongs_to :item, polymorphic: true
  belongs_to :mix_task
  belongs_to :work
  has_many :order_parts
  has_many :order_units

  enum mix_status: {
    not_mix: 0,       # 未混单
    mixed: 1,    # 已混单
    no_need_mixed: 2 #不需要混单
  }

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

end
