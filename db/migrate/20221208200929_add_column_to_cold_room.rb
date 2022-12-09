class AddColumnToColdRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :cold_rooms, :name, :string
  end
end
