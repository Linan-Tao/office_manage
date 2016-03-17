class Agent < ActiveRecord::Base
  belongs_to :province
  belongs_to :city
  belongs_to :district


  #下单条件：1.全款 2.定金 3.直接
  enum order_condition: [:full, :part, :nothing]

  def self.order_condition
    [['全款', 'full'], ['定金', 'part'], ['直接', 'nothing']]
  end

  def order_condition_name
    case order_condition
      when 'full' then '全款'
      when "part" then '定金'
      when "nothing" then '直接'
    else
      "未知状态"
    end
  end


   #下单条件：1.全款 2.定金 3.直接
  enum send_condition: [:fulls, :parts, :nothings]

  def self.send_condition
    [['全款', 'fulls'], ['定金', 'parts'], ['直接', 'nothings']]
  end

  def send_condition_name
    case send_condition
      when 'fulls' then '全款'
      when "parts" then '定金'
      when "nothings" then '直接'
    else
      "未知状态"
    end
  end

end
