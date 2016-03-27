class ProduceTask < ActiveRecord::Base
  # belongs_to :order
  belongs_to :item, polymorphic: true
  belongs_to :mix_task
  belongs_to :work
  has_many :order_parts
  has_many :order_units
  has_one :purchase

  # enum mix_status: {
  #   not_mix: 0,       # 未混单
  #   mixed: 1,    # 已混单
  #   no_need_mixed: 2 #不需要混单
  # }
  # def mix_status_name
  #   case mix_status
  #     when 'mixed' then '已混单'
  #     when "not_mix" then '未混单'
  #     when "no_need_mixed" then '无需混单'
  #   else
  #     "未知状态"
  #   end
  # end

  # def self.mix_status
  #   [["已混单", "mixed"], ["未混单","not_mix"], ["无需混单","no_need_mixed"]]
  # end

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
    pur =  self.build_purchase
    pur.item_id = self.item_id
    pur.item_type = self.item_type
    pur.number = self.number
    pur.check_status = 0
    pur.save!
  end

end
