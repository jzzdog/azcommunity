require 'test_helper'

class UserNotifierTest < ActionMailer::TestCase
  test "confirmation" do
    mail = UserNotifier.confirmation
    assert_equal "Confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "greeting" do
    mail = UserNotifier.greeting
    assert_equal "Greeting", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
