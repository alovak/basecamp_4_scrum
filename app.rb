require 'rubygems'
require 'sinatra'
require 'erb'
require 'active_resource'
require 'lib/basecamp'
require 'lib/card'

set :public, File.dirname(__FILE__) + '/static'

get '/' do
  @cards = Card.find('ms 10')
  content_type 'text/html', :charset => 'utf-8'
  haml :cards
end
