# frozen_string_literal: true

module Error
  module Helpers
    class Render
      def self.json(error)
        {
          error: error
        }.as_json
      end
    end
  end
end
