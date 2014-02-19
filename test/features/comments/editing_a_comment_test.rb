require "test_helper"

feature "Comments / Editing A Comment" do
  scenario "unauthorized site user cannot edit or approve comment to post" do
    visit post_path(posts(:http))
    page.wont_have_content "Approve"
    page.wont_have_content "Destroy"
  end

  scenario "author can approve comment to post" do
    sign_in(:author)
    visit post_path(posts(:http))
    click_on "Approve"
    click_on "Sign Out"
    visit post_path(posts(:http))
    page.must_have_content comments(:c1).content
  end

  scenario "editor can approve comment to post" do
    sign_in(:editor)
    visit post_path(posts(:http))
    click_on "Approve"
    click_on "Sign Out"
    visit post_path(posts(:http))
    page.must_have_content comments(:c1).content
  end

  scenario "unauthorized site user cannot edit or approve comment to projects" do
    visit project_path(projects(:portfolio))
    page.wont_have_content "Approve"
    page.wont_have_content "Destroy"
  end

  scenario "author can approve comment to project" do
    sign_in(:author)
    visit project_path(projects(:portfolio))
    click_on "Approve"
    click_on "Sign Out"
    visit project_path(projects(:portfolio))
    page.must_have_content comments(:c2).content
  end

  scenario "editor can approve comment to project" do
    sign_in(:editor)
    visit project_path(projects(:portfolio))
    click_on "Approve"
    click_on "Sign Out"
    visit project_path(projects(:portfolio))
    page.must_have_content comments(:c2).content
  end
end
