require "test_helper"

feature "Comments / Editing A Comment" do
  scenario "unauthorized site user cannot edit or approve comment" do

  end

  scenario "author can approve comment" do
    sign_in(:author)
    visit post_path(posts(:http))
    click_on "Approve"
    click_on "Sign Out"
    visit post_path(posts(:http))
    page.must_have_content comments(:c1).content
  end

  scenario "editor can approve comment" do
    sign_in(:editor)
    visit post_path(posts(:http))
    click_on "Approve"
    click_on "Sign Out"
    visit post_path(posts(:http))
    page.must_have_content comments(:c1).content
  end
end
