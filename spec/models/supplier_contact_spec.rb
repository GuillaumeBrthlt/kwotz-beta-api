require 'rails_helper'

RSpec.describe SupplierContact, type: :model do
  before(:each) do
    @user = User.create(email: 'test@mail.com', password: 'azerty')
    @supplier = Supplier.create(user_id: @user.id, alias: "test", address: "test", city: "test", zipcode: "01test", favorite: true)
    @suppliercontact = SupplierContact.create(supplier_id: @supplier.id, first_name: "Prénom", last_name: "Nom", email: "supmail@test.com")
  end

  context 'validation' do
    it 'create SupplierContact model when all attributes are given' do
      expect(@suppliercontact).to be_a(SupplierContact)
      expect(@suppliercontact).to be_valid
    end

    describe 'a bad SupplierContact attributes' do
      it 'should not be valid with a expected attribute missing' do
        bad_SupplierContact = SupplierContact.create(first_name: "Prénom", last_name: "Nom")
        expect(bad_SupplierContact).not_to be_valid
        expect(bad_SupplierContact.errors.include?(:email)).to eq(true)
      end
    end
  end
end

