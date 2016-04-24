class OrderUnit < ActiveRecord::Base
  has_one :produce_tasks, as: :item
  belongs_to :order

  enum state: {
    not_create: 0,       # 未创建生产任务
    created: 1,    # 已创建生产任务
  }

  def ply_name
    MaterialCategory.find_by(id: self.ply).try(:name)
  end

  def texture_name
    MaterialCategory.find_by(id: self.texture).try(:name)
  end

  def face_name
    MaterialCategory.find_by(id: self.face).try(:name)
  end

  def color_name
    MaterialCategory.find_by(id: self.color).try(:name)
  end
end
