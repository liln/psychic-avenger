require "test_helper"

feature "Posts / Creating a Post" do
  scenario "author submits form data to create a new post" do
    # Given an authorized user completes a new post form
    sign_in(:author)

    visit new_post_path
    fill_in "Title", with: posts(:cf).title
    fill_in "Body", with: posts(:cf).body

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:cf).title
    assert page.has_css? "#author"
    page.text.must_include users(:author).email
    page.text.must_include "Status: Unpublished"
  end

  scenario "unauthenticated site visitors cannot create new posts" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site visitors cannot see new post button" do
    visit posts_path
    page.wont_have_link "New Post"
  end

  scenario "authors cannot publish posts" do
    sign_in(:author)
    visit new_post_path
    page.wont_have_field('Published')
  end

  scenario "editors can publish posts" do
    sign_in(:editor)
    visit new_post_path
    page.must_have_field('Published')

    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"
    click_on "Create Post"

    page.text.must_include "Status: Published"
  end
end
