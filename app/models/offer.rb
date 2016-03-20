class Offer < ActiveRecord::Base
	belongs_to :item, polymorphic: true
	attr_accessor :material_category_id, :material_type_id
end
