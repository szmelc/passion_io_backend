# frozen_string_literal: true

module API
  module V1
    class Base < Core
      version 'v1', using: :path

      mount Categories::Base
      mount Courses::Base
      mount Verticals::Base
    end
  end
end
