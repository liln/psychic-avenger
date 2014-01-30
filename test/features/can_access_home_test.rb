require "test_helper"

feature "Home / Can access home page" do
  scenario "root page contains content" do
    visit '/'
    page.text.must_include "Lillian Ng"
  end
end
