require 'rubygems'
require 'bundler'
Bundler.require
require 'faye'


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
run faye_server
