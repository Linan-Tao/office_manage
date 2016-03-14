class Material < ActiveRecord::Base
	has_many :purchases, as: :item
end
