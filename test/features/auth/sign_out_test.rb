require "test_helper"

feature "Authentication / Sign In and Out" do
  scenario "sign in and sign out" do
    sign_in(:author)

    page.must_have_content users(:author).email
    page.wont_have_content "Sign In"

    click_on "Sign Out"

    page.must_have_content "Sign Up"
    page.must_have_content "Sign In"
    page.wont_have_content "Sign Out"
  end
end
