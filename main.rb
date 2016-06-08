require 'sinatra'
require 'open-uri'

def staff
  url = "https://rawgit.com/spencerlarry/2a01b56ffe8121c94179d65a6528a997/raw/91cfa2ae45c8dd52d302f2e09407833cffc3b757/test-for-ruby.html"

  text = URI.parse(url).read
  output = ""

  text.each_line do |line|
    if line.include? "class=\"staff\">"
      cleaning = line.split("class=\"staff\"\>")[1]
      result = cleaning.split("<br>")[0]
      output += "<li>#{result}</li> "
    end
  end
  return output
end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/staff' do
  "<link href='style.css' rel='stylesheet' type='text/css'>" +
  staff
end
