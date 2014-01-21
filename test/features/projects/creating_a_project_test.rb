require "test_helper"

feature "As a site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "add a new project" do
    visit projects_path
    click_on "New project"

    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Foundation, HTML5, CSS3"
    fill_in "Description", with: "This is how I learned RoR web development."

    click_on "Create Project"

    # Then a new project should be created and displayed
    page.text.must_include "Project has been created"
    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Rails"
  end
end
