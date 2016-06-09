require 'sinatra'
require 'open-uri'
require 'pdf-reader'

require_relative 'staff'
require_relative 'projects'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/staff' do
  staff
end

get '/projects' do
  projects
end
