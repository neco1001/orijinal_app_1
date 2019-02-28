require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    sign_in users(:michael)
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    patch user_registration_path, params: { user: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'devise/registrations/edit'
    assert_select 'div.alert', "4 個のエラーにより、この user を保存できません："
  end

  test "successful edit" do
    sign_in users(:michael)
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_registration_path, params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "",
                                              current_password: "password" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    # assert_equal email, @user.email
 end
end
