class Supplier < ActiveRecord::Base
  validates_presence_of :name, :mobile, :bank_account
end
