require "test_helper"

feature "Authentication / Sign Up" do
  scenario "sign up" do
    # Given a registration form
    visit root_path
    click_on "Sign Up"

    # When I register with valid info
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    # Then I should be signed up
    page.must_have_content "Signed in as test@example.com"
    page.wont_have_content "There was a problem with your sign up"
  end
end
