# frozen_string_literal: true

module API
  class Core < Grape::API
    prefix :api
    format :json
    include Grape::Kaminari

    helpers API::Helpers::AuthHelpers

    mount API::V1::Base

    add_swagger_documentation \
      mount_path: '/docs',
      info: {
        title: 'Passion.io Recruitment Task',
        contact_name: 'Lukasz Szmelc',
        contact_email: 'lszmelc@gmail.com'
      },
      security_definitions: {
        api_key: { type: 'oauth', name: 'Authorization', in: 'header' }
      }
  end
end
