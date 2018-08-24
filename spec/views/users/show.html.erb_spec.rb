require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before do
    address = Address.new(street: 'street 1', city: 'New York', house_nr: "21")
    assign(:user, FactoryBot.create(:user, name: "John", address: address))
    render
  end

  it 'renders header' do
    expect(rendered).to have_content("User")
  end

  it 'renders first_name' do
    expect(rendered).to have_content("John")
  end
end