require 'rails_helper'

RSpec.describe Supplier, type: :model do
  before(:each)do
    @user = User.create(email: "test@email.fr", password: "azerty")
    @supplier = Supplier.create(alias: "enterprise", address: "2 boulevard Cimiez", city: "Toulouse", zipcode: "31000", favorite: true, user_id: 1)
  

    context 'validation' do
      it 'create Supplier model when all attributes are present' do
        expect(@supplier).to be_a(Supplier)
        expect(@supplier).to be_valid
    end

      describe 'Supplier with bad attributes' do
        it 'should not to be valid when attributes are missing' do
          bad_supplier = Supplier.create(address: "2 boulevard Cimiez", city: "Toulouse", zipcode: "31000", favorite: true, user_id: 1)
          expect(bad_supplier).not_to be_valid
          expect(bad_supplier.errors.include?(:alias)).to eq(true)
        end
      end
    end
  end
end