class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :company
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :role
      t.string :first_name
      t.string :last_name
      t.string :shipping_alias
      t.string :shipping_address
      t.string :shipping_zipcode
      t.string :shipping_city
      t.string :phone_number
      t.timestamps
    end
  end
end
