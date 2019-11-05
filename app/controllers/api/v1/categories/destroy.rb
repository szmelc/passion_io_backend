# frozen_string_literal: true

module API
  module V1
    module Categories
      class Destroy < Base
        desc 'Deletes a course'
        delete do
          category = Category.find(params[:id])
          authorize category, :delete?

          category.destroy!
          body false
        end
      end
    end
  end
end
