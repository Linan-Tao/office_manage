class Material < ActiveRecord::Base
	belongs_to :material_category
	belongs_to :material_type
	belongs_to :supplier
	validates :material_category_id, uniqueness: { scope: :material_type_id }
end
