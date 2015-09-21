require 'cuba'
require 'redis'

Cuba.reset!

Cuba.define do
  on get do
    on root do
      redis = Redis.new(host: ENV['REDIS_PORT_6379_TCP_ADDR'], port: ENV['REDIS_PORT_6379_TCP_PORT'])
      redis.incr('visits')
      redis.incr('visits')

      res.write("Hello world! #{redis.get('visits')} visits since last execution.")
    end

    on 'hello/:name' do |name|
      res.write("Hello, #{name}! Nice to see you here! ;)")
    end

    on 'now/:name' do |name|
      res.write("Hello, #{name}! Now is #{Time.now}")
    end
  end
end

