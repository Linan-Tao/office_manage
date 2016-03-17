class Material < ActiveRecord::Base
  has_many :purchases, as: :item
  belongs_to :supplier
end
