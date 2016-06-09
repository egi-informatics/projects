def load_rp
  url = "http://egi.utah.edu/downloads/research_portfolio/EGI_Research_Portfolio.pdf"

  io = open(url)
  reader = PDF::Reader.new(io)
  output = ""

  output += "<div class='rp area'>" + "<h3>Research Portfolio</h3>"

  pre_sort = ""

  # Goes through each page of the pdf
  reader.pages.each do |page|
    text = page.text
    new_line = ""

    # Skipps pages without I numbers
    if !text.include? "I 0"
      next
    end

    number = get_num(text)
    new_line += "<div class='num'>#{number}</div>"

    status = get_status(text)
    new_line += "<div class='status'>#{status}</div>"

    pre_sort += "<li>#{new_line}</li>\n"
  end


  output += sort(pre_sort) + "</div>"

  return output
end

# Seaches page for I number
def get_num(text)
  text.each_line do |line|
    if line.include? "I 0"
      line.gsub!("I 0", " I0")
      array = line.split(" ")

      array.each do |word|
        if word.include? "I0"
          remove_letters(word)

          if word.length == 6
            word += "  "
          end
          return word
        end
      end
    end
  end
end

# Searches page for project status
def get_status(text)
  text.each_line do |line|
    if line.include? "In Development"
      return "Development"
    end
    if line.include? "Completed"
      return "Completed"
    end
    if line.include? "In Progress"
      return "Progress"
    end
  end
end

# Removes all letters and unwanted characters from string
def remove_letters(word)
  chars = word.split('')
  chars.each do |char|
    if !number?(char) && char != "I" && char != "_"
      word.gsub!(char, '')
    end
  end
end

# Checks if character is a number
def number?(char)
  char =~ /[[:digit:]]/
end

# Sort text
def sort(text)
  list = []
  sorted = ""
  text.each_line do |line|
    list.push line
  end
  list.sort!

  list.each do |item|
    sorted += item
  end
  return sorted
end
