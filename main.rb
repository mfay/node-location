require 'sinatra'
require './classes.rb'


DataMapper.setup(:default, 'postgres://bmzjountfgwget:aTEha_001oHl-U1AXLNsqxH3QC@ec2-54-243-188-56.compute-1.amazonaws.com:5442/d4o1ri8u9q1f7u')
DataMapper.finalize

get '/' do
	peeps = ""
	Person.all.each do |p|
		peeps += "#{p.first_name} #{p.last_name}<br/>"
	end
	peeps
end
