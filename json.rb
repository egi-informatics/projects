require 'json'

def json
  url = "http://egi.utah.edu/api/research.json"
  text = URI.parse(url).read

  json = JSON.parse(text)

  result = ""
  pre_sort = ""

  json.each do |name, project|
    number = project["id"]
    if number.include? "Q"
      next
    end
    status = project["status"]
    if status == "Complete"
      status = "Completed"
    end
    pre_sort += "<li><div class='num'>#{number}</div><div class='status'>#{status}</div>\n"
  end


  return sort(pre_sort)
end
