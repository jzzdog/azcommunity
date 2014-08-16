require 'test_helper'

class UserNotifierTest < ActionMailer::TestCase
  test "confirmation" do
    @user = users(:one)
    mail = UserNotifier.confirmation(@user)
    assert_equal "Email confiramtion", mail.subject
    assert_equal ["dmanishchenko@gmail.com"], mail.to
    assert_equal ["allianz.community@gmail.com"], mail.from
    assert_match "hash", mail.body.encoded
  end

  test "greeting" do
    mail = UserNotifier.greeting
    assert_equal "Greeting", mail.subject
    assert_equal ["dmanishchenko@gmail.com"], mail.to
    assert_equal ["allianz.community@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
