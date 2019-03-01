require 'test_helper'

class DeviseMailerTest < ActionMailer::TestCase

  test "confirmation_instructions" do
    user = users(:michael)
    user.confirmation_token = Devise.friendly_token[0,20]
    mail = Devise::Mailer.confirmation_instructions(user, user.confirmation_token)
    assert_equal "アカウントの登録方法", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["please-change-me-at-config-initializers-devise@example.com"], mail.from
    assert_match user.confirmation_token, mail.body.encoded
  end

  test "reset_password_instructions" do
    user = users(:michael)
    user.reset_password_token = Devise.friendly_token[0,20]
    mail = Devise::Mailer.reset_password_instructions(user, user.reset_password_token)
    assert_equal "パスワードの再設定", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["please-change-me-at-config-initializers-devise@example.com"], mail.from
    assert_match user.reset_password_token, mail.body.encoded
  end
end
