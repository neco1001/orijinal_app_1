require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "写真管理"
    assert_equal full_title("写真管理について"), "写真管理について | 写真管理"
  end
end
