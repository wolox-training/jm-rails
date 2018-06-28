# frozen_string_literal: true

class EmailWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
  end
end
