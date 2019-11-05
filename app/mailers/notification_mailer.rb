# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  default to: -> { User.pluck(:email) }

  def course_created
    subject = I18n.t('mailers.notification_mailer.course_created')
    mail(subject: subject)
  end
end
