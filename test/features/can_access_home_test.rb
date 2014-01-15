require "test_helper"

class CanAccessHomeTest < Capybara::Rails::TestCase
  test "sanity" do
    visit '/'
    assert_content page, "Lillian Ng"
    refute_content page, "Goobye All!"
  end
end
