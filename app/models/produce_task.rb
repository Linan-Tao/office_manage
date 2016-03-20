class ProduceTask < ActiveRecord::Base
  belongs_to :order
  belongs_to :item, polymorphic: true
  belongs_to :mix_task
  belongs_to :work
  has_many :order_parts
  has_many :order_units

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
