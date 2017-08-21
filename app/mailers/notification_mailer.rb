class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.schedule_confirmation.subject
  #
  def schedule_confirmation(schedule)
    @greeting = "Hi"
    @schedule = schedule
    mail to: "#{schedule.educator.user.email}"
  end
end
