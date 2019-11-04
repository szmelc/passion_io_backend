# frozen_string_literal: true

require 'doorkeeper/grape/helpers'

module API
  module Helpers
    module AuthHelpers
      extend ::Grape::API::Helpers
      include Doorkeeper::Grape::Helpers

      def authenticate_user!
        unauthorized_error unless authenticated?
      end

      def authenticated?
        doorkeeper_token.present? ? doorkeeper_authorize!.nil? : false
      end

      def unauthorized_error
        error!({ errors: ['Unauthorized'] }, 401)
      end

      def current_user
        user = doorkeeper_token.present? ? doorkeeper_user : env['warden'].authenticate(scope: :user)
        authenticated? && user
      end

      def doorkeeper_user
        doorkeeper_token.resource_owner_id ? User.find(doorkeeper_token.resource_owner_id) : unauthorized_error
      end
    end
  end
end
