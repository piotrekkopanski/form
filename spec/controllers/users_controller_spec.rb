require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @address = Address.new(street: 'street', city: 'New York', house_nr: "11")
    @user = User.create(name: "name", email: "exam@ww.pl", address: @address )
  end

  it "should render index" do
    get :index
    should render_template :index
  end

  it "should render new" do
    get :new
    should render_template :new
  end

  it "should render edit" do
    get :edit, params: {:id => @user.id}
    should render_template :edit
  end

  it "should render show" do
    get :show, params: {:id => @user.id}
    should render_template :show
  end

  it "updates a user" do
    put :update, params: { user: FactoryBot.attributes_for(:user, first_name:"Sample_name", address: @address), id: User.last.id }
    expect(assigns(:user)).to be_valid
    expect(response).to redirect_to(user_path(User.last))
  end

  it "allow destroy" do
    @user = FactoryBot.create(:user, address: @address)
    expect{
      delete :destroy, params: { id: User.last.id }                
    }.to change(User,:count).by(-1)
  end
end