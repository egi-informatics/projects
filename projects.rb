def projects
  url = "http://egi.utah.edu/downloads/research_portfolio/EGI_Research_Portfolio.pdf"

  io = open(url)
  reader = PDF::Reader.new(io)
  output = ""

  output +=
      "<h3>Research Portfolio</h3>" +
      "<textarea id='project-text'>"
  reader.pages.each do |page|
    text = page.text
    if !text.include? "I 0"
      next
    end

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

            output += word
            break
          end
        end
        break
      end
    end

    text.each_line do |line|
      if line.include? "In Development"
        output += "  Development"
        break
      end
      if line.include? "Completed"
        output += "  Completed"
        break
      end
      if line.include? "In Progress"
        output += "  Progress"
        break
      end
    end

    output += "\n"

  end
  output.chomp!
  output += "</textarea>" +
  "<script>auto_grow($('#project-text').get(0));</script>"

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
