class Purchase < ActiveRecord::Base
  belongs_to :item, polymorphic: true
  belongs_to :user
  belongs_to :produce_task
  validates_presence_of :item_id, :item_type

  enum check_status: {
  	not_submit: 0,
    not_check: 1,       # 未审核
    checked: 2,    # 审核通过
    check_failed: 3 #审核失败
  }
  def check_status_name
    case check_status
    	when 'not_submit' then '未提交审核'
      when 'not_check' then '未审核'
      when "checked" then '审核通过'
      when "check_failed" then '审核失败'
    else
      "未知状态"
    end
  end

  def self.check_status
    [['未提交审核', 'not_submit'], ["未审核", "not_check"], ["审核通过","checked"], ["审核失败","check_failed"]]
  end

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
