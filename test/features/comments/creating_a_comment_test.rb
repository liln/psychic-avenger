require "test_helper"

feature "Comments / Creating a Comment" do
  scenario "unauthorized site user cannot add comments to blog post" do
    visit post_path(posts(:http))
    page.wont_have_content "Create Comment"
  end

  scenario "site user can add comments to blog post" do
    sign_in(:user)
    visit post_path(posts(:http))
    fill_in "comment_content", with: "some stuff"
    click_on "Create Comment"
    page.must_have_content "Comment was submitted for approval"
  end

  scenario "unauthorized site user cannot add comments to project" do
    visit project_path(projects(:portfolio))
    page.wont_have_content "Create Comment"
  end

  scenario "site user can add comments to project" do
    sign_in(:user)
    visit project_path(projects(:portfolio))
    fill_in "comment_content", with: "some stuff"
    click_on "Create Comment"
    page.must_have_content "Comment was submitted for approval"
  end

end
