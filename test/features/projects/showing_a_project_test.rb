require "test_helper"

feature "As a site visitor, I want to view project details" do
  scenario "viewing a single project" do
    visit project_path(projects(:portfolio))

    page.must_have_content projects(:portfolio).name
    page.must_have_content projects(:portfolio).technologies_used
  end
end
