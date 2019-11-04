# frozen_string_literal: true

GrapeSwaggerRails.options.before_action_proc = proc {
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
}
GrapeSwaggerRails.options.url = '/api/docs'
GrapeSwaggerRails.options.app_name = 'Passion.io Recruitment Task'
GrapeSwaggerRails.options.hide_url_input = true
GrapeSwaggerRails.options.hide_api_key_input = false

GrapeSwaggerRails.options.api_auth = 'bearer'
GrapeSwaggerRails.options.api_key_name = 'Authorization'
GrapeSwaggerRails.options.api_key_type = 'header'
