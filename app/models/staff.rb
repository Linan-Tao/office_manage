class Staff < ActiveRecord::Base
  belongs_to :user
  belongs_to :department
  validates_presence_of :user_id,:name, :id_card, :status


#下单条件：1.在职 2.离职 3.休假
  enum status: [:busy, :leave, :pending]

  def self.status
    [['在职', 'busy'], ['离职', 'leave'], ['休假', 'pending']]
  end

  def status_name
    case status
      when 'busy' then '在职'
      when "leave" then '离职'
      when "pending" then '休假'
    else
      "未知状态"
    end
  end
end
