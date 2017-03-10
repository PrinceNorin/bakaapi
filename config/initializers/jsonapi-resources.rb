JSONAPI.configure do |config|
  config.default_paginator = :offset
  config.default_page_size = 30
  config.maximum_page_size = 300

  config.json_key_format = :underscored_key
  config.route_format = :underscored_route

  config.top_level_meta_include_record_count = true
  config.top_level_meta_record_count_key = :total
  config.top_level_meta_include_page_count = true
  config.top_level_meta_page_count_key = :total_pages

  config.exception_class_whitelist = [Pundit::NotAuthorizedError]
  config.default_processor_klass = JSONAPI::Authorization::AuthorizingProcessor
end
