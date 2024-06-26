# /Users/Wander/Documents/Desenvolvimento/background-jobs/config/initializers/redis.rb

require 'redis'

if Rails.env.production?
  $redis = Redis.new(url: ENV["REDIS_URL"])
else
  redis_config = YAML.load(File.open(Rails.root.join('config/redis.yml')), aliases: true)[Rails.env]
  $redis = Redis.new(host: redis_config["host"], port: redis_config["port"])
end
