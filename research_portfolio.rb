def load_rp
  url = 'http://egi.utah.edu/downloads/research_portfolio/EGI_Research_Portfolio.pdf'

  io = open(url)
  reader = PDF::Reader.new(io)
  output = ''

  # Goes through each page of the pdf
  reader.pages.each do |page|
    text = page.text

    # Skips pages without I numbers
    next unless text.include? 'I 0'

    number = get_num(text)
    status = get_status(text)

    output += "<tr><td>#{number}</td><td>#{status}</td></tr>" + "\n"
  end

  output = sort(output)
  output = wrap(output, "table")

  output

end

# Seaches page for I number
def get_num(text)
  text.each_line do |line|
    next unless line.include? 'I 0'
    line.gsub!('I 0', ' I0')
    array = line.split(' ')

    array.each do |word|
      next unless word.include? 'I0'
      remove_letters(word)

      word += '  ' if word.length == 6
      return word
    end
  end
end

# Searches page for project status
def get_status(text)
  text.each_line do |line|
    return 'Development' if line.include? 'In Development'
    return 'Completed' if line.include? 'Completed'
    return 'Progress' if line.include? 'In Progress'
  end
end
