# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      user = User.create_from_omniauth(omniauth_params)
      sign_in_and_redirect user, event: :authentication if user.persisted?
    end

    def failure
      session['devise.google_data'] = omniauth_params
      redirect_to :root, alert: @user.errors.full_messages.join("\n")
    end

    private

    def omniauth_params
      request.env['omniauth.auth']
    end
  end
end
