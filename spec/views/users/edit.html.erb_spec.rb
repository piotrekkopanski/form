require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before do
    @address = Address.new(street: 'street 1', city: 'New York', house_nr: "21")
    assign(:user, FactoryBot.create(:user, address: @address))
    render
  end

  it 'renders header' do
    expect(rendered).to have_content("Editing User")
  end

  it 'renders form' do
    expect(rendered).to have_field('user[name]')
    expect(rendered).to have_field('user[email]')
    expect(rendered).to have_selector("input[type=submit][value='Update User']")
    expect(rendered).to have_link('Back', :href => "/users")
  end
end