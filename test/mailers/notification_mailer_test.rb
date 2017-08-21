require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "schedule_confirmation" do
    mail = NotificationMailer.schedule_confirmation
    assert_equal "Schedule confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
