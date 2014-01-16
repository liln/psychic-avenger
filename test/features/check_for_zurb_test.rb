require "test_helper"

feature "Check for Zurb" do
  scenario "load the root page" do
    # Given I load the root
    # When I load the root
    visit '/'

    # Zurb is loaded if there are columns
    response.body.should have_css("div.columns")
  end
end
