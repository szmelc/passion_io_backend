# frozen_string_literal: true

module API
  module V1
    module Categories
      class Index < Base
        desc 'Return list of categories'
        paginate per_page: 10, max_per_page: 30, offset: false
        params do
          requires :vertical_id, type: Integer, desc: 'ID of associated vertical'
        end
        get do
          authorize Category, :index?

          categories = Category.where(vertical_id: params[:vertical_id])
          paginate(categories)
        end
      end
    end
  end
end
