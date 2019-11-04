# frozen_string_literal: true

module API
  module V1
    module Verticals
      class Index < Base
        get do
          JSON.parse(Vertical.all.to_json)
        end
      end
    end
  end
end
