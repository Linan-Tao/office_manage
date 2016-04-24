class AddColumnsToOffers < ActiveRecord::Migration
  def change
    add_reference :offers, :order, index: true, foreign_key: true
  end
end
