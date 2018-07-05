# frozen_string_literal: true

class UserContext
  attr_reader :user, :user_id

  def initialize(user, user_id)
    @user = user
    @user_id = user_id
  end
end
