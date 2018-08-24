require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before do
    assign(:user, User.new())
    render
  end

  it 'renders header' do
    expect(rendered).to have_content("New User")
  end

  it 'renders form' do
    expect(rendered).to have_field('user[name]')
    expect(rendered).to have_field('user[email]')
    expect(rendered).to have_selector("input[type=submit][value='Create User']")
    expect(rendered).to have_link('Back', :href => "/users")
  end
end