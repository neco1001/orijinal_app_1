require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:michael)
  end

  test "password resets" do
    get new_user_password_path
    assert_template 'devise/passwords/new'
    # メールアドレスが無効
    post user_password_path, params: { user: { email: "" } }
    # assert_not flash.empty?
    assert_template 'devise/passwords/new'
    # メールアドレスが有効
    post user_password_path,
         params: { user: { email: @user.email } }
    assert_not_equal @user.reset_password_token, @user.reload.reset_password_token
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?

    # リダイレクト先を変更したい
    # assert_redirected_to root_url

    # # パスワード再設定フォームのテスト
    # user = assigns(:user)
    # # メールアドレスが無効
    # get edit_user_password_path(user.reset_token, email: "")
    # assert_redirected_to root_url
    # # 無効なユーザー
    # user.toggle!(:activated)
    # get edit_password_reset_path(user.reset_token, email: user.email)
    # assert_redirected_to root_url
    # user.toggle!(:activated)
    # # メールアドレスが有効で、トークンが無効
    # get edit_password_reset_path('wrong token', email: user.email)
    # assert_redirected_to root_url
    # # メールアドレスもトークンも有効
    # get edit_password_reset_path(user.reset_token, email: user.email)
    # assert_template 'password_resets/edit'
    # assert_select "input[name=email][type=hidden][value=?]", user.email
    # # 無効なパスワードとパスワード確認
    # patch password_reset_path(user.reset_token),
    #       params: { email: user.email,
    #                 user: { password:              "foobaz",
    #                         password_confirmation: "barquux" } }
    # assert_select 'div#error_explanation'
    # # パスワードが空
    # patch password_reset_path(user.reset_token),
    #       params: { email: user.email,
    #                 user: { password:              "",
    #                         password_confirmation: "" } }
    # assert_select 'div#error_explanation'
    # # 有効なパスワードとパスワード確認
    # patch password_reset_path(user.reset_token),
    #       params: { email: user.email,
    #                 user: { password:              "foobaz",
    #                         password_confirmation: "foobaz" } }
    # assert is_logged_in?
    # assert_not flash.empty?
    # assert_redirected_to user
  end
end
