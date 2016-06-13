require 'json'

def json
  url = 'http://egi.utah.edu/api/research.json'
  text = URI.parse(url).read

  json = JSON.parse(text)

  output = ''

  json.each do |_name, project|
    number = project['id']
    next if number.include? 'Q'
    status = project['status']

    status = 'Completed'    if status.include? 'Comp'
    status = 'Development'  if status.include? 'Dev'
    status = 'Progress'     if status.include? 'Prog'

    output += "<li><div class='num'>#{number}</div><div class='status'>#{status}</div>\n"
  end

  sort(output)
end
