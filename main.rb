require 'sinatra'
require 'open-uri'
require 'pdf-reader'

require_relative 'functions'
require_relative 'research_portfolio'
require_relative 'staff'
require_relative 'json'
require_relative 'projects'
require_relative 'below_map'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/staff' do
  staff
end

get '/projects' do
  projects
end

get '/research-portfolio' do
  send_file File.join(settings.public_folder, 'projects.html')
end

get '/json' do
  json
end

get '/below-map' do
  below_map
end
