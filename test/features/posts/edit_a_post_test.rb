require "test_helper"

feature "Editing a Post" do
  scenario "author submit updates to an existing post" do
    # Given an existing post
    sign_in(:author)
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

  scenario "editor publish to an existing post" do
    # Given an existing post
    sign_in(:editor)
    post = posts(:cr)
    visit post_path(post)

    # When I click and submit changed data
    click_on "Edit"
    check "Published"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Post was successfully updated"

    click_on "Sign Out"
    visit posts_path
    page.text.must_include posts(:cr).title
  end

  scenario "unauthenticated site vistors cannot edit posts" do
    visit posts_path
    page.wont_have_content "Edit"
  end
end
