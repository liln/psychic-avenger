require "test_helper"

feature "Check for Zurb" do
  scenario "root page contains columns" do
    # Given I load the root
    # When I load the root
    visit root_path

    # Zurb is loaded if there are columns
    page.body.must_match 'foundation'
    page.body.must_match 'columns'
  end
end
