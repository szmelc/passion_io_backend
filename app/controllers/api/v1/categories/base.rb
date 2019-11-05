# frozen_string_literal: true

module API
  module V1
    module Categories
      class Base < API::V1::Base
        resource :categories do
          before { authenticate_user! }

          mount Create
          mount Index

          route_param :id do
            mount Destroy
          end
        end
      end
    end
  end
end
