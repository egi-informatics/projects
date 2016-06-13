def load_json
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

    output += "<tr><td>#{number}</td><td>#{status}</td></tr>" + "\n"
  end

  output = sort(output)
  output = wrap(output, "table")
end
