# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :current_user, :authenticate_request, except: %i[renew invalidate_all]

      def create
        if authenticated_user?
          token_data = AuthenticableEntity.generate_access_token(user)
          render json: {
            access_token: token_data[:token], renew_id: token_data[:renew_id]
          }, status: :ok
        else
          render_error('Invalid email or password', :unauthorized)
        end
      end

      # TODO: Refactor and remove rubocop exception
      # rubocop:disable Metrics/AbcSize
      def renew
        if !authentication_manager.warning_expiration_date_reached?
          render_error('Warning expiration date has not been reached', :forbidden)
        elsif !authentication_manager.valid_renew_id?(renew_token_params[:renew_id])
          render_error('Invalid renew_id', :unauthorized)
        elsif !authentication_manager.able_to_renew?
          render_error('Access token is not valid anymore', :unauthorized)
        else
          access_token = authentication_manager.renew_access_token(current_user)
          render json: { access_token: access_token }, status: :ok
        end
      end
      # rubocop:enable Metrics/AbcSize

      def invalidate_all
        current_user.generate_verification_code
        if current_user.save
          head :ok
        else
          render json: { error: 'Error invalidating all tokens' }, status: :internal_server_error
        end
      end

      private

      def render_error(error_message, status)
        render json: { error: error_message }, status: status
      end

      def authenticated_user?
        user.present? && user.valid_password?(authenticate_params[:password])
      end

      def user
        @user ||= User.find_by(email: authenticate_params[:email])
      end

      def authenticate_params
        params.require(:sessions).permit(:email, :password)
      end

      def renew_token_params
        params.require(:sessions).permit(:renew_id)
      end

      def authentication_manager
        @authentication_manager ||= AuthenticationManager.new(request.headers)
      end
    end
  end
end
