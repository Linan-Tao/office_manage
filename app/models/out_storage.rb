class OutStorage < ActiveRecord::Base
  belongs_to :department
  belongs_to :produce_task
  belongs_to :user
  belongs_to :item, polymorphic: true
  validates_presence_of :out_date, :out_user, :produce_task, :item_id, :item_type, :number
  after_create :update_work

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

  def update_work
  	if produce_task.work_id == Work.find_by(symbol_name: "arrived").id
			produce_task.work_id = Work.find_by(symbol_name: "xia_liao").id
			produce_task.save!
  	end
  end

end
