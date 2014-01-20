require "test_helper"

feature "Can access home page" do
  scenario "root page contains content" do
    # Given I load the root
    # When I load the root
    visit '/'

    # Page contains portfolio content
    page.text.must_include "Lillian Ng"
  end
end
