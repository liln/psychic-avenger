require "test_helper"

feature "Creating a Post" do
  scenario "submit form data to create a new post" do
    # Given an authorized user completes a new post form
    sign_in

    visit new_post_path
    fill_in "Title", with: "Code Rails"
    fill_in "Body", with: "This is how I learned web development."

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include "Code Rails"
    assert page.has_css? "#author"
    page.text.must_include users(:one).email
  end
end
