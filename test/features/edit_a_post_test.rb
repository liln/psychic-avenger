require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    post = posts(:cf)
    visit post_path(post)

    # When I click and submit changed data
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Becoming a Web Developer"
  end
end
