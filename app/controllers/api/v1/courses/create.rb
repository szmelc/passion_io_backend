# frozen_string_literal: true

module API
  module V1
    module Courses
      class Create < Base
        desc 'Adds a course'
        params do
          requires :name, type: String, desc: 'Name of new category'
          requires :state, type: Integer, desc: 'Category state'
          requires :category_id, type: Integer, desc: 'ID of associated category'
        end
        post do
          authorize Course, :create?

          result = CourseServices::Create.new(declared(params), current_user).call
          result.success? ? result : return_errors(result.data)
        end
      end
    end
  end
end
