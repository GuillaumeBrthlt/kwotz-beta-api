class CreateColdRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :cold_rooms do |t|
      t.integer :temperature
      t.string :condensing_unit
      t.boolean :prod_outside
      t.integer :refrigerant_type
      t.integer :length
      t.integer :width
      t.integer :height
      t.integer :volume
      t.string :product_types
      t.string :entries_frequency
      t.integer :entries_quantity
      t.integer :heat_sources_power
      t.text :heat_sources
      t.text :comment
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end