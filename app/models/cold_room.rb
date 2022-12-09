class ColdRoom < ApplicationRecord
  belongs_to :project
  validates :temperature, presence: true
  validates :condensing_unit, presence: true
  validates :prod_outside, presence: true
  validates :refrigerant_type, presence: true
  validates :volume, presence: true

end
