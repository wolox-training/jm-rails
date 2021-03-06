# frozen_string_literal: true

module Api
  module V1
    class RentsController < ApiController
      before_action :authenticate_request
      include Pundit
      include Wor::Paginate
      def index
        @rents = Rent.where(user_id: params[:user_id])
        authorize @rents
        render_paginated @rents, each_serializer: RentSerializer
      end

      def show
        @rent = Rent.find_by!(user_id: params[:user_id], id: params[:id])
        authorize @rent
        render json: @rent
      end

      def create
        @rent = Rent.new(rent_params)
        authorize @rent
        if @rent.valid?
          @rent.save
          RentMailer.new_rent_notification(@rent).deliver_later
          render json: @rent
        else
          render json: @rent.errors, status: :unprocessable_entity
        end
      end

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :from, :to)
      end

      def destroy
        @rent = User.find(params.require(:user_id)).rents.find(params[:id])
        authorize @rent
        @rent.destroy
        head :no_content
      end

      def pundit_user
        UserContext.new(current_user, params[:user_id])
      end
    end
  end
end
