require 'rails_helper'

RSpec.feature 'User', :type => :feature do
  describe 'user action:' do
    before do
      @address = Address.new(street: 'street 1', city: 'New York', house_nr: "21")
      @user = FactoryBot.create(:user, address: @address)
    end

    it 'shows index user page' do
      visit '/users'
      expect(page).to have_content "Users"
    end
  
    it 'adds user' do
      visit '/users/'
      click_on 'New User'
      fill_in 'user[name]', with: 'First_name'
      fill_in 'user[email]', with: 'email@wp.pl'
      fill_in 'user[address_attributes][street]', with: 'street'
      fill_in 'user[address_attributes][city]', with: 'Radzyń'
      fill_in 'user[address_attributes][house_nr]', with: '21'
      click_button 'Create User'
      expect(page).to have_content 'User was successfully created.'
    end

    it 'not adds user with invalid number of house' do
      visit '/users/'
      click_on 'New User'
      fill_in 'user[name]', with: 'First_name'
      fill_in 'user[email]', with: 'email@wp.pl'
      fill_in 'user[address_attributes][street]', with: 'street'
      fill_in 'user[address_attributes][city]', with: 'Radzyń'
      fill_in 'user[address_attributes][house_nr]', with: '-1'
      click_button 'Create User'
      expect(page).to have_content "Address house nr must be greater than 0"
    end

    it 'show user' do
      visit '/users'
      first(:link, 'Show').click
      expect(page).to have_content "Back"
    end

    it 'return to index' do
      visit '/users/1'
      click_link 'Back'
      expect(page).to have_content "Users"
    end

    it 'destroy user' do
      visit '/users'
      click_link 'Destroy'
      expect(page).to have_content "User was successfully destroyed."
    end 
  end
end