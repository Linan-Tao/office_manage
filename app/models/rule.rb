class Rule < ActiveRecord::Base
  belongs_to :mould
  belongs_to :board
  belongs_to :craft
  belongs_to :part
  validates_presence_of :name, :code, :mould_id, :board_id, :craft_id, :part_id
end
