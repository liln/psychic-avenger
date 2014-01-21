require "test_helper"

feature "As a site owner, I want to edit my projects so that I can correct typos" do
  scenario "edit an existing project" do
    visit edit_project_path(projects(:portfolio))

    fill_in "Name", with: "My Rad Portfolio"
    click_on "Update Project"

    page.text.must_include "success"
    page.text.must_include "Rad Portfolio"
    page.text.wont_include "Code Fellows Portfolio"
  end

  scenario "incorrectly editing an existing project" do
    visit edit_project_path(projects(:portfolio))

    fill_in "Name", with: "Q"
    click_on "Update Project"

    page.text.must_include("prohibited")
    page.text.must_include("Name is too short")
  end
end
