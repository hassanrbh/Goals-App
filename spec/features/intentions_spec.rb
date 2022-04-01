require 'rails_helper'

RSpec.feature "Intentions", type: :feature do
  feature "the creating process" do
    before(:each) do
      visit "/intentions/new"
    end
    scenario "see the goals page" do
      expect(page).to have_content /New Goal/
    end
    feature "creating a goal" do
      scenario "when the goal is created" do
        fill_in "name", :with => "buying food for my mom"
        check "status"
        click_button "New Goal"

        expect(page).to have_content /You have successfully created/
      end
      scenario "when the goal is not created" do
        fill_in "name", :with => ""
        click_button "New Goal"
                
        expect(page).to have_content /Buying food for my mom/
      end
    end
  end
end
