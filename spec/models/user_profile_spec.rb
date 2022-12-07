require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  before(:each) do
    @user2 = User.create(email: "test2@test.com", password: "password")
    @UserProfile = UserProfile.create(user_id: @user2.id, company: "tests", address: "testing", zipcode: "3test", city: "testland", function: "tester", first_name: "test", last_name: "test", complete: true, shipping_alias: "test alias", shipping_address: "test address", shipping_zipcode: "testzip", shipping_city: "city test", phone_number: "0612345678")
  end

  context 'validation' do
    it 'create UserProfile model when all attributes are given' do
      expect(@UserProfile).to be_a(UserProfile)
      expect(@UserProfile).to be_valid
    end
    
    describe 'a bad UserProfile attributes' do
      it 'should not be valid with a expected attribute missing' do
        bad_UserProfile = UserProfile.create(zipcode: "3test", city: "testland", function: "tester", first_name: "test", last_name: "test", complete: true, shipping_alias: "test alias", shipping_address: "test address", shipping_zipcode: "testzip", shipping_city: "city test", phone_number: "0612345678")
        expect(bad_UserProfile).not_to be_valid
        expect(bad_UserProfile.errors.include?(:address)).to eq(true)
      end
    end
  end
end
