def json
  url = "http://egi.utah.edu/api/research.json"
  text = URI.parse(url).read

  result = ""

  text.each_line do |line|
    if line.include? "\"id\" : \"I0"
      remove_letters(line)
      result += line + "<br>"
      next
    end
  end

  return result
end
