require "test_helper"

feature "Check for Zurb" do
  scenario "foundation is installed" do
    # Given I load the root
    # When I load the root
    visit root_path

    # Zurb is loaded if there are columns
    assert page.has_css? ".columns"
  end
end
