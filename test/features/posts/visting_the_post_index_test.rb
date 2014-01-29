require "test_helper"

feature "Visiting the Post Index" do
  scenario "unauthorized site user visits post index" do
    visit posts_path
    page.text.must_include posts(:bdd).title
    page.text.wont_include posts(:cr).title
  end
end
