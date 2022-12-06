class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :alias
      t.string :address
      t.string :city
      t.string :zipcode
      t.boolean :favorite
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
