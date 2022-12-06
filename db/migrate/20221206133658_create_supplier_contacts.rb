class CreateSupplierContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :supplier_contacts do |t|
      t.references :supplier, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
