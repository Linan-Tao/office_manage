class ItemStorage < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :purchase
end
