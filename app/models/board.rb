class Board < ActiveRecord::Base
  validates_presence_of :name, :code
end
