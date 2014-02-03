require "test_helper"

feature "Comments / Creating a Comment" do
  scenario "site user can add comments to blog post" do
    visit post_path(posts(:http))

    fill_in "comment_content", with: "This is awesome!"
    click_on "Create Comment"

    page.must_have_content "Comment was submitted for approval"
  end
end
