require "test_helper"

feature "As a site user, I want to be able to sign in and out so that not everyone has access to my account." do
  scenario "sign in and sign out" do
    visit new_user_session_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Sign in"

    page.must_have_content "Signed in as user@example.com"
    page.wont_have_content "Sign In"

    click_on "Sign Out"

    page.must_have_content "Sign Up"
    page.must_have_content "Sign In"
    page.wont_have_content "Sign Out"
  end
end
