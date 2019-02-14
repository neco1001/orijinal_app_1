require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", full_title
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", full_title("写真管理について")
  end
end
