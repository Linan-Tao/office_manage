class Offer < ActiveRecord::Base
    belongs_to :order_union
	belongs_to :item, polymorphic: true
	attr_accessor :ply, :texture, :face, :color
end
