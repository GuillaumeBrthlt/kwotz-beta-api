class ColdRoom < ApplicationRecord
  belongs_to :project
  validates :temperature, presence: true
  validates :condensing_unit, presence: true
  validates :product_outside, presence: true
  validates :refrigerant_type, presence: true
  validates :volume, presence: true
  validates :product_types, presence: true
before_create :volum_calculation

  def volum_calculation
    if !self.volume
      self.volume == self.length * self.width * self.heigth
    end
  end

end
