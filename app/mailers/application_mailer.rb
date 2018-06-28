# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'notifications@jm.bookstore.com'
  layout 'mailer'
end
