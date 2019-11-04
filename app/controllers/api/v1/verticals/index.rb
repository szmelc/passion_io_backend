# frozen_string_literal: true

module API
  module V1
    module Verticals
      class Index < Base
        desc 'Return list of verticals'
        paginate per_page: 10, max_per_page: 30, offset: false
        get do
          paginate(Vertical.all)
        end
      end
    end
  end
end
