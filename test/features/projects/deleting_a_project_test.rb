require "test_helper"

feature "Deleting a Project" do
  scenario "post is deleted from index with a click" do
    visit projects_path

    page.find("a[href='#{project_path(projects(:portfolio))}'][data-method='delete']").click

    page.wont_have_content "How meta"
  end

  scenario "post is deleted from project page with a click" do
    visit edit_project_path(projects(:freelance))

    click_on "Delete Project"

    page.wont_have_content "Barnyard Cereal"
  end
end
