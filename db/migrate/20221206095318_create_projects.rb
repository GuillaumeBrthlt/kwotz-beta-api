class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :status, default: 0
      t.text :message
      t.references :supplier_contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
