class Material < ActiveRecord::Base
  belongs_to :material_category
  belongs_to :supplier
  validates_presence_of :ply, :texture, :face, :color, :supplier
end
