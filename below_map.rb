def below_map()
  url = 'https://egi.utah.edu/research/current-projects/?mode=quick'
  text = URI.parse(url).read
  output = ""

  text.each_line do |line|
    if line.include? "id=\"i0"
      num = line[/\"i0.*?\"/]
      num.gsub! "i", "I"
      remove_letters(num)
      output += "<li>#{num}</li>\n"
      output = sort(output)
    end
  end

  return output
end
