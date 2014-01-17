require "test_helper"

feature "Check for Zurb" do
  scenario "load the root page" do
    # Given I load the root
    # When I load the root
    visit root_path

    # Zurb is loaded if there are columns
    page.has_css?('div columns')
  end
end
