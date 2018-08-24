require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    @address = Address.new(street: 'street 1', city: 'New York', house_nr: "21")
  end

  describe "Validations" do
    it "is not valid without a name" do
      user = User.new(name: nil, email: "example@wp.pl", address: @address)
      expect(user).to_not be_valid
    end

    it "is not valid without a email" do
      user = User.new(name: "John", email: nil, address: @address)
      expect(user).to_not be_valid
    end

    it "is not valid without a valid email" do
      user = User.new(name: "John", email: "email", address: @address)
      expect(user).to_not be_valid
    end

    it "is not valid without a house number" do
      address = Address.new(street: 'street 1', city: 'New York', house_nr: nil)
      user = User.new(name: "John", email: "email", address: address)
      expect(user).to_not be_valid
    end

    it "is not valid without a valid house number" do
      address = Address.new(street: 'street 1', city: 'New York', house_nr: "-1")
      user = User.new(name: "John", email: "email", address: address)
      expect(user).to_not be_valid
    end

    it "is valid without street in address" do
      address = Address.new(street: nil, city: 'New York', house_nr: "11")
      user = User.new(name: "name", email: "exam@ww.pl", address: address )
      expect(user).to be_valid
    end

    it "is valid without city in address" do
      address = Address.new(street: 'street 1', city: nil, house_nr: "11")
      user = User.new(name: "name", email: "exam@ww.pl", address: address )
      expect(user).to be_valid
    end
  end

  describe "Associations" do
    it { should have_one(:address) }
  end
end