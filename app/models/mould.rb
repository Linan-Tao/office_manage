class Mould < ActiveRecord::Base
  validates_presence_of :name, :code, :mould_category_id
  belongs_to :mould_category
end
