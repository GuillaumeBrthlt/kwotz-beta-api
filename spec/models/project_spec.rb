require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:each) do
    @user = User.create(email: "test@test.com", password: "password")
    @supplier = Supplier.create(user_id: @user.id, alias: "test", address: "test 3", city: "testland", zipcode: "3test", favorite: true)
    @supplier_contact = SupplierContact.create(supplier_id: @supplier.id, first_name: "tester", last_name: "testing", email: "test@test.com")
    @project = Project.create(user_id: @user.id, name: "test", status: 0, message: "I test things", supplier_contact_id: @supplier_contact.id)
  end

  context 'validation' do
    it 'create a Project model when all attributes are given' do
      expect(@project).to be_a(Project)
      expect(@project).to be_valid
    end
    
    describe 'a bad Project attributes' do
      it 'should not be valid with an expected attribute missing' do
        bad_Project = Project.create(status: 0, message: "I test things", supplier_contact_id: @supplier_contact.id)
        expect(bad_Project).not_to be_valid
        expect(bad_Project.errors.include?(:user)).to eq(true)
      end
    end
  end
end
