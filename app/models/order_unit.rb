class OrderUnit < ActiveRecord::Base
  has_one :produce_tasks, as: :item

  enum state: {
    not_create: 0,       # 未创建生产任务
    created: 1,    # 已创建生产任务
  }
end
