require "test_helper"

class PasswordsMailerTest < ActionMailer::TestCase
  test "reset" do
    mail = PasswordsMailer.reset(users(:one))
    assert_equal "Reset your password", mail.subject
    assert_equal [ "user@example.com" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "You can reset your password within the next 15 minutes on this password reset", mail.body.encoded
  end
end
