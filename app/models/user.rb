# frozen_string_literal: true

class User < ApplicationRecord
  has_many :rents, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  # Hooks
  before_validation :generate_verification_code, on: :create

  def generate_verification_code
    self.verification_code = AuthenticableEntity.verification_code
  end

  def self.create_from_omniauth(params)
    user = find_or_create_by(provider: params.provider, uid: params.uid)
    user.update(User.omniauth_credentials_params(params.credentials)
                    .merge(User.omniauth_info_params(params.info)))
    user
  end

  def self.omniauth_credentials_params(params)
    {
      token: params.token,
      expires: params.expires,
      expires_at: params.expires_at,
      refresh_token: params.refresh_token
    }
  end

  def self.omniauth_info_params(params)
    {
      email: params.email,
      last_name: params.last_name,
      first_name: params.first_name,
      password: Devise.friendly_token[0, 20]
    }
  end
end
