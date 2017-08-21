# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/schedule_confirmation
  def schedule_confirmation
    NotificationMailer.schedule_confirmation
  end

end
