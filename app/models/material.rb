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

  def name
    [MaterialCategory.find(self.ply).name, MaterialCategory.find(self.texture).name,MaterialCategory.find(self.face).name,MaterialCategory.find(self.color).name].join('-')
  end
end
