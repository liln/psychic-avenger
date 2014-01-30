require "test_helper"

feature "Project / View Projects - Portfolio Index" do
  scenario "viewing all projects" do
    visit projects_path

    page.text.must_include projects(:freelance).name
    page.text.must_include projects(:portfolio).name
    page.wont_have_content "Edit"
    page.wont_have_content "Destroy"
  end
end
