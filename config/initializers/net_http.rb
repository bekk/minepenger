require 'faraday'

module Faraday
  module Adapter
    class NetHttp < Middleware
     alias_method :orig_call, :call
     def call(env)
       env[:ssl] ||= Hash[]
       env[:ssl][:verify] = false
       orig_call(env)
     end
    end
  end
end