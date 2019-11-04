# frozen_string_literal: true

module API
  class Core < Grape::API
    prefix :api
    format :json

    add_swagger_documentation \
      mount_path: '/docs',
      info: {
        title: 'Passion.io Recruitment Task',
        contact_name: 'Lukasz',
        contact_email: 'lszmelc@gmail.com'
      }
  end
end
