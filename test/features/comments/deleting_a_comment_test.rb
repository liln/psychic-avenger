require "test_helper"

feature "Comments / Deleting a Comment" do
  scenario "author can delete comments to posts" do
    sign_in(:author)
    visit post_path(posts(:http))
    page.find("a[href='#{post_comment_path(posts(:http).id,comments(:c1).id)}'][data-method='delete']").click
    page.wont_have_content "yay http!"
  end

  scenario "editor can delete comments to posts" do
    sign_in(:editor)
    visit post_path(posts(:http))
    page.find("a[href='#{post_comment_path(posts(:http).id,comments(:c1).id)}'][data-method='delete']").click
    page.wont_have_content "yay http!"
  end

  scenario "author can delete comments to projects" do
    sign_in(:author)
    visit post_path(projects(:portfolio))
    page.find("a[href='#{project_comment_path(posts(:portfolio).id,comments(:c2).id)}'][data-method='delete']").click
    page.wont_have_content "portfolio is ugly"
  end

  scenario "editor can delete comments to projects" do
    sign_in(:editor)
    visit post_path(projects(:portfolio))
    page.find("a[href='#{project_comment_path(posts(:portfolio).id,comments(:c2).id)}'][data-method='delete']").click
    page.wont_have_content "portfolio is ugly"
  end
end
