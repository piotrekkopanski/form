require "spec_helper"

describe "users/index.html.erb" do
  it "displays all the users" do
    assign(:users, [
      stub_model(User, :name => "name_one"),
      stub_model(User, :name => "name_two")
    ])

    render

    expect(response).to have_content "name_one"
    expect(response).to have_content "name_two"
  end
end