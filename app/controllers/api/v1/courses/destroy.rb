# frozen_string_literal: true

module API
  module V1
    module Courses
      class Destroy < Base
        desc 'Deletes a course'
        delete do
          course = Course.find(params[:id])
          authorize course, :delete?

          course.destroy!
          body false
        end
      end
    end
  end
end
