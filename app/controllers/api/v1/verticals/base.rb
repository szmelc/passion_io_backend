# frozen_string_literal: true

module API
  module V1
    module Verticals
      class Base < API::V1::Base
        resource :verticals do
          mount Index
        end
      end
    end
  end
end
