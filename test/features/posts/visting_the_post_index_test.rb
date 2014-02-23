require "test_helper"

feature "Posts / Visiting the Post Index" do
  scenario "unauthorized site user visits post index" do
    visit posts_path
    page.text.must_include posts(:bdd).title
    page.text.wont_include posts(:cr).title
  end

  scenario "site user visits post index" do
    sign_in(:user)
    visit posts_path
    page.text.must_include posts(:bdd).title
    page.text.wont_include posts(:cr).title
  end
end
