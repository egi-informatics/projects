def projects
  url = "http://egi.utah.edu/downloads/research_portfolio/EGI_Research_Portfolio.pdf"

  io = open(url)
  reader = PDF::Reader.new(io)
  output = ""

  output += "<h3>Research Portfolio</h3>"

  reader.pages.each do |page|
    text = page.text
    new_line = ""

    # Skipps pages without I numbers
    if !text.include? "I 0"
      next
    end

    # Seaches page for I number
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

            new_line += "<div class='num'>#{word}</div>"
            break
          end
        end
        break
      end
    end

    # Searches page for project status
    status = ""
    text.each_line do |line|
      if line.include? "In Development"
        status += "Development"
        break
      end
      if line.include? "Completed"
        status += "Completed"
        break
      end
      if line.include? "In Progress"
        status += "Progress"
        break
      end
    end
    new_line += "<div class='status'>#{status}</div>"

    output += "<li>#{new_line}</li>"

  end
  output.chomp!

  return output
end

def remove_letters(word)
  chars = word.split('')
  chars.each do |char|
    if !number?(char) && char != "I" && char != "_"
      word.gsub!(char, '')
    end
  end
end

def number?(char)
  char =~ /[[:digit:]]/
end
