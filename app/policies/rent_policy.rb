# frozen_string_literal: true

class RentPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user_context, record)
    @user = user_context.user
    @user_id = user_context.user_id
    @record = record
  end

  def destroy?
    user.present? && record.user == user
  end

  def show?
    user.present? && record.user == user
  end

  def create?
    user.present?
  end

  def index?
    user.id == @user_id.to_i
  end
end
