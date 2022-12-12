class ChangeRefrigerantTypeToBeStringInColdRooms < ActiveRecord::Migration[7.0]
  def up
     change_column :cold_rooms, :refrigerant_type, :string
  end

  def down
    change_column :cold_rooms, :refrigerant_type, :integer
  end
end
