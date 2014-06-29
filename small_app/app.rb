# encoding: UTF-8

require 'sinatra'
require 'haml'

get '/' do
  haml :index, locals: {today: Date.today}
end
