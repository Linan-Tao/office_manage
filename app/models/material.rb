class Material < ActiveRecord::Base
  belongs_to :material_category
  belongs_to :supplier
  validates_presence_of :ply, :texture, :face, :color

   before_create :generate_code

  def generate_code
    begin
      self.code = SecureRandom.hex(3)
    end while self.class.exists?(:code => code)
  end
end
