require 'rails_helper'

RSpec.feature "Auths", type: :feature do
  feature "the signup process" do
    before(:each) do
      visit "/users/new"
    end
    scenario 'has a new user page' do
      expect(page).to have_content /Sign Up!/
    end
    feature "signing up a user" do
      scenario "shows username on the homepage after signup" do
        fill_in "username", with: 'test'
        fill_in "password", with: 'password'
        fill_in "email", with: 'test@gmail.com'
        fill_in "birth_date", with: 2005 
        click_button "Sign Up"
        expect(page).to have_content  /Welcome test/
      end
    end
  end

  feature "the logging in process" do
    given!(:user) { FactoryBot.create(:user) }

    before(:each) do
      visit "/sessions/new"
    end
    scenario "it shows the login page" do
      expect(page).to have_content /Login in!/
    end
    scenario "shows username on the homepage after login" do

      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_button "login"
      expect(page).to have_content /Welcome #{user.username}/
    end
  end
  feature "the logging out process" do
    given!(:user) { FactoryBot.create(:user) }

    before(:each) do
      visit "/sessions/new"
      fill_in "email", :with => user.email
      fill_in "password", :with => user.password
      click_button "login"
    end
    scenario "where we see the login out button" do
      expect(page).to have_content /Welcome #{user.username}/
    end
    scenario "where we don't see the username in the homepage" do
      click_button "logout"
      expect(page).to have_content /Goal App/
    end
  end
end
