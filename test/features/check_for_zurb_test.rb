require "test_helper"

feature "Home / Check for Zurb" do
  scenario "foundation is installed" do
    visit root_path

    # Zurb is loaded if there are columns
    assert page.has_css? ".columns"
  end
end
