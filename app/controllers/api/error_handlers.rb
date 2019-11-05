# frozen_string_literal: true

module API
  module ErrorHandlers
    extend ActiveSupport::Concern

    included do
      rescue_from Grape::Exceptions::ValidationErrors do |e|
        validation_errors = {}
        e.errors.each { |k, v| validation_errors.merge!({ k[0] => v }) }
        error!({ errors: validation_errors }, 400)
      end

      rescue_from Pundit::NotAuthorizedError do |e|
        message = (e.query.nil? ? 'Forbidden' : "Not allowed to #{e.query} objects of this class.")
        error!({ errors: [message] }, 403)
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        error!({ errors: [e.message] }, 404)
      end
    end
  end
end
