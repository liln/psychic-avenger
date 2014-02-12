require "test_helper"

feature "Projects / Creating A Project" do
  scenario "add a new project" do
    sign_in
    visit projects_path
    url = page.current_path
    click_on "New project"

    page.current_path.must_match url
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Foundation, HTML5, CSS3"
    fill_in "Description", with: "This is how I learned RoR web development."

    click_on "Create Project"
    page.current_path.must_match url

    # Then a new project should be created and displayed
    page.text.must_include "Project has been created"
    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Rails"
  end

  scenario "new project has invalid data" do
    # Given invalid project data is entered in a form
    sign_in
    visit new_project_path
    fill_in "Name", with: "Q"

    # When the form is submitted with a short name and missing technologies_used field
    click_on "Create Project"

    # Then the form should be displayed again, with an error message
    current_path.must_match /projects$/
    #page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end

end
