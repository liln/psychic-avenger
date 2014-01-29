require "test_helper"

feature "Check for theme" do
  scenario "root page contains navigation header and footer" do
    visit root_path

    # Base 2013 theme is loaded if there is navigation, header, and footer
    page.body.must_match 'nav'
    page.body.must_match 'header_nav'
    page.body.must_match 'footer'
  end
end
