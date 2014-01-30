require "test_helper"

feature "Posts / Deleting a Post" do
  scenario "editors can delete post with a click" do
    sign_in(:editor)
    # Given an existing post
    visit posts_path

    # When the delete link is clicked
    page.find("a[href='#{post_path(posts(:http))}'][data-method='delete']").click

    # Then the post is deleted
    page.wont_have_content "Intro to HTTP"
  end

  scenario "unauthenticated site vistors cannot delete posts" do
    visit posts_path
    page.wont_have_content "Destroy"
  end

  scenario "authors cannot delete posts" do
    sign_in(:author)
    visit posts_path
    page.wont_have_content "Destroy"
  end

end
