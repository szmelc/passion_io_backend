# frozen_string_literal: true

module API
  module V1
    module Categories
      class Create < Base
        desc 'Adds a category'
        params do
          requires :name, type: String, desc: 'Name of new category'
          requires :state, type: Integer, desc: 'Category state'
          requires :vertical_id, type: Integer, desc: 'ID of associated vertical'
        end
        post do
          authorize Category, :create?

          result = CategoryServices::Create.new(declared(params)).call
          result.success? ? result : return_errors(result.data)
        end
      end
    end
  end
end
