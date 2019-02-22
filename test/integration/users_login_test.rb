require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with invalid information" do
    get new_user_session_path
    assert_template 'sessions/new'
    post user_session_path, params: { user: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get new_user_session_path
    post user_session_path, params: { user: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", new_user_session_path, count: 0
    assert_select "a[href=?]", destroy_user_session_path
    assert_select "a[href=?]", user_path(@user)
    delete destroy_user_session_path
    assert_redirected_to root_url
    # 2番目のウィンドウでログアウトをクリックするユーザーをシミュレートする
    delete destroy_user_session_path
    follow_redirect!
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", destroy_user_session_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end
