require 'rubygems'
require 'bundler'
Bundler.require
require 'faye'

class ServerAuth
  def incoming(message, callback)
    callback.call(message)
  end
end

faye_server = Faye::RackAdapter.new(
			:mount => '/faye', 
			:timeout => 25,
			:engine => {
				:type => 'redis',
				:host => 'stingfish.redistogo.com',
				:port => '9898',
				:password => 'a38b2f53ff7ac893a7670b2231aad529',
				:database => 1
			})
faye_server.add_extension(ServerAuth.new)
run faye_server
