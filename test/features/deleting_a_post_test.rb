require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    # Given an existing post
    visit posts_path

    # When the delete link is clicked
    first(posts(:http).title)
    click_on "Destroy"

    # Then the post is deleted
    page.wont_have_content posts(:http).title
  end
end
