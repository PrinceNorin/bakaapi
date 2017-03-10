$redis = ConnectionPool.new(size: ENV['RAILS_MAX_THREADS'] || 5) do
  Redis.new(host: ENV['REDIS_HOST'], port: ENV['REDIS_PORT'])
end
