# frozen_string_literal: true

module API
  module V1
    module Verticals
      class Index < Base
        desc 'Return list of verticals'
        paginate per_page: 10, max_per_page: 30, offset: false
        get do
          authorize Vertical, :index?

          paginate(Vertical.includes(:categories).all)
        end
      end
    end
  end
end
