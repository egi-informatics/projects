require 'sinatra'
require 'open-uri'
require 'pdf-reader'
require 'json'

require_relative 'functions'
require_relative 'research_portfolio'
require_relative 'staff'
require_relative 'json'
require_relative 'below_map'
require_relative 'pages'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/staff' do
  load_staff
end

get '/projects' do
  send_file File.join(settings.public_folder, 'projects.html')
end

get '/research-portfolio' do
  load_rp
end

get '/json' do
  load_json
end

get '/below-map' do
  load_below
end

get '/pages' do
  load_pages
end
