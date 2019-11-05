# frozen_string_literal: true

module API
  module V1
    module Courses
      class Index < Base
        desc 'Return list of courses'
        paginate per_page: 10, max_per_page: 30, offset: false
        params do
          requires :category_id, type: Integer, desc: 'ID of associated category'
        end
        get do
          authorize Course, :index?

          courses = Course.includes(:author).where(category_id: params[:category_id])
          paginate(courses)
        end
      end
    end
  end
end
