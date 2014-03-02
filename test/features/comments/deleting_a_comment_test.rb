require "test_helper"

feature "Comments / Deleting a Comment" do
  scenario "author can delete comments to posts" do
    sign_in(:author)
    visit post_path(posts(:http))
    page.find("a[href='/en#{post_comment_path(posts(:http),comments(:c1))}'][data-method='delete']").click
    page.wont_have_content "yay http!"
  end

  scenario "editor can delete comments to posts" do
    sign_in(:editor)
    visit post_path(posts(:http))
    page.find("a[href='/en#{post_comment_path(posts(:http),comments(:c1))}'][data-method='delete']").click
    page.wont_have_content "yay http!"
  end

  scenario "author can delete comments to projects" do
    sign_in(:author)
    visit project_path(projects(:portfolio))
    page.find("a[href='/en#{project_comment_path(projects(:portfolio),comments(:c2))}'][data-method='delete']").click
    page.wont_have_content "portfolio is ugly"
  end

  scenario "editor can delete comments to projects" do
    sign_in(:editor)
    visit project_path(projects(:portfolio))
    page.find("a[href='/en#{project_comment_path(projects(:portfolio),comments(:c2))}'][data-method='delete']").click
    page.wont_have_content "portfolio is ugly"
  end
end
