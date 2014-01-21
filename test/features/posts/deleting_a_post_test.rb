require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    # Given an existing post
    visit posts_path

    # When the delete link is clicked
    page.find("a[href='#{post_path(posts(:http))}'][data-method='delete']").click

    # Then the post is deleted
    page.wont_have_content "Intro to HTTP"
  end
end
