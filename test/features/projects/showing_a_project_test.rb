require "test_helper"

feature "Project / Show A Project" do
  scenario "viewing a single project" do
    visit project_path(projects(:portfolio))

    page.must_have_content projects(:portfolio).name
    page.must_have_content projects(:portfolio).technologies_used
  end
end
