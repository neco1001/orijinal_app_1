require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user       = users(:michael)
    @other_user = users(:archer)
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to new_user_session_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    sign_in users(:archer)
    assert_not @other_user.admin?
    patch user_registration_path, params: {
                                    user: { password: "",
                                            password_confirmation: "",
                                            admin: true } }
    assert_not @other_user.reload.admin?
  end

  test "should redirect following when not logged in" do
   get following_user_path(@user)
   assert_redirected_to new_user_session_url
 end

 test "should redirect followers when not logged in" do
   get followers_user_path(@user)
   assert_redirected_to new_user_session_url
 end
end
