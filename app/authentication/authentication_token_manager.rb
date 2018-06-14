# frozen_string_literal: true

class AuthenticationTokenManager
  class << self
    def encode(payload)
      JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end

    def decode(token)
      payload = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
      AuthenticationDecodedToken.new(payload)
    rescue StandardError
      nil
    end
  end
end
