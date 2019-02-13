require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "トップページ | 写真管理"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "写真管理について | 写真管理"
  end
end
