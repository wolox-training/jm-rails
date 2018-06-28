# frozen_string_literal: true

class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.new_rent_notification.subject
  #
  def new_rent_notification(rent)
    @rent = rent
    mail to: @rent.user.email
  end
end
