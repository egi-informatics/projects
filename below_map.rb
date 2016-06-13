def load_below
  url = 'https://egi.utah.edu/research/current-projects/?mode=quick'
  text = URI.parse(url).read
  output = ''

  text.each_line do |line|
    next unless line.include? 'id="i0'
    num = line[/\"i0.*?\"/]
    num.tr! 'i', 'I'
    remove_letters(num)

    output += "<tr><td>#{num}</td></tr>" + "\n"

  end

  output = sort(output)
  output = wrap(output, "table")
  output
end
