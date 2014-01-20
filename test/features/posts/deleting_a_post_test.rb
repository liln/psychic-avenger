require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    # Given an existing post
    visit posts_path

    # When the delete link is clicked
    within("tr", :text => posts(:http).title) do
      click_on "Destroy"
    end

    # Then the post is deleted
    page.wont_have_content "Intro to HTTP"
  end
end
