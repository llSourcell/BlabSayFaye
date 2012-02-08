require 'rubygems'
require 'bundler'
Bundler.require
require 'faye'


faye_server = Faye::RackAdapter.new(
			:mount => '/faye', 
			:timeout => 25,
			:engine => {
				:type => 'redis',
				:host => 'icefish.redistogo.com',
				:port => '9229',
				:password => '35113abe57ba883734f012e7db6d4e93',
				:database => 1
			})
run faye_server
