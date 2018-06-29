# frozen_string_literal: true

class RentMailer < ApplicationMailer
  def new_rent_notification(rent)
    @rent = rent
    I18n.with_locale(@rent.user.locale) do
      mail to: @rent.user.email, subject: I18n.t('mail.new_rent_notification.subject')
    end
  end
end
