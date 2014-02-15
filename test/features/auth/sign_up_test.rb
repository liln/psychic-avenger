require "test_helper"

feature "Authentication / Sign Up" do
  scenario "sign up" do
    # Given a registration form
    visit posts_path
    click_on "Sign Up"

    # When I register with valid info
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    # Then I should be signed up
    page.wont_have_content "There was a problem with your sign up"
    visit posts_path
    page.must_have_content "Signed in as test@example.com"
  end
end
