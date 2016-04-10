class Offer < ActiveRecord::Base
    belongs_to :order
	belongs_to :item, polymorphic: true
	attr_accessor :ply, :texture, :face, :color
end
