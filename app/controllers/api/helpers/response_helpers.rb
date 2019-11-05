# frozen_string_literal: true

module API
  module Helpers
    module ResponseHelpers
      def return_errors(resource)
        error!({ errors: resource.errors.messages }, 422)
      end
    end
  end
end
