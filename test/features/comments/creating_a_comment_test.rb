require "test_helper"

feature "Comments / Creating a Comment" do
  scenario "site user can add comments to blog post" do
    visit post_path(:http)
    click_on "New Comment"

    fill_in "Comment", with: "This is awesome!"
    click_on "Create Comment"

    page.text.must_have_content "Comment was submitted for approval"
  end
end
