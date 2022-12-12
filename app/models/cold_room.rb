class ColdRoom < ApplicationRecord
  belongs_to :project, dependent: :destroy
  validates :temperature, presence: true
  validates :condensing_unit, presence: true
  validates :refrigerant_type, presence: true
  validates :volume, presence: true

end
