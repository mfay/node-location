require 'data_mapper'
require './classes.rb'

namespace :db do

	task :config do
		DataMapper.setup(:default, 'postgres://bmzjountfgwget:aTEha_001oHl-U1AXLNsqxH3QC@ec2-54-243-188-56.compute-1.amazonaws.com:5442/d4o1ri8u9q1f7u')
	end

	task :seed => :install do
		one = Person.new
		one.first_name = "Mark"
		one.last_name = "Fay"
		one.save!


		two = Person.new
		two.first_name = "Matt"
		two.last_name = "Fay"
		two.save!
	end       
	task :update => :config do
			DataMapper.auto_upgrade!
	end

	task :install => :config do
			DataMapper.auto_migrate!
	end
end
