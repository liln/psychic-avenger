require "test_helper"

feature "Visting the Post Index" do
  scenario "with existing posts" do
    # Given existing posts
    # True by the fixture

    # When I visit /posts
    visit posts_path

    #Then the existing posts should be loaded
    page.text.must_include posts(:bdd).title
  end
end
