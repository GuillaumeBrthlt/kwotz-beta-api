require 'rails_helper'

RSpec.describe ColdRoom, type: :model do
  before(:each)do
    @user = User.create(email: "test@email.fr", password: "azerty")
    @supplier = Supplier.create(alias: "enterprise", address: "2 boulevard Cimiez", city: "Toulouse", zipcode: "31000", favorite: true, user_id: 1)
    @supplier_contact = SupplierContact.create(supplier_id: @supplier.id, first_name: "first test", last_name: "last test", email: "test@email.fr")
    @project = Project.create(user_id: @user.id, name: "test", status: 0, message: "I am a test message", supplier_contact_id: @supplier_contact.id)
    @cold_room = ColdRoom.create(temperature: 35, condensing_unit: "test condensing_unit", prod_outside: true, refrigerant_type: 3, length: 35, width: 35, height: 35, volume: 80, product_types: "test product_types", entries_frequency: "test entries_frequency", entries_quantity: 300, heat_sources_power: 35, heat_sources: "test heat_sources", comment: "I am a test comment")

    context 'validation' do
      it 'create Supplier model when all attributes are present' do
        expect(@cold_room).to be_a(ColdRoom)
        expect(@cold_room).to be_valid
    end

      describe 'Supplier with bad attributes' do
        it 'should not to be valid when attributes are missing' do
          bad_cold_room = ColdRoom.create(condensing_unit: "test condensing_unit", prod_outside: true, refrigerant_type: 3, length: 35, width: 35, height: 35, volume: 80, product_types: "test product_types", entries_frequency: "test entries_frequency", entries_quantity: 300, heat_sources_power: 35, heat_sources: "test heat_sources", comment: "I am a test comment")
          expect(bad_supplier).not_to be_valid
          expect(bad_supplier.errors.include?(:temperature)).to eq(true)
        end
      end
    end
  end
end
