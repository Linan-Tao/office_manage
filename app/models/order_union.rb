class OrderUnion < ActiveRecord::Base
  belongs_to :agent
  has_many :orders
  has_many :offers, dependent: :destroy

  accepts_nested_attributes_for :orders, :offers, :allow_destroy => true
  before_create :generate_code

  def generate_code
  	begin
      self.code = Time.new.strftime('%Y%m%d') +'-'+ SecureRandom.hex(2)
    end while self.class.exists?(:code => code)
  end

end
