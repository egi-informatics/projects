# Removes all letters and unwanted characters from string
def remove_letters(word)
  chars = word.split('')
  chars.each do |char|
    word.gsub!(char, '') if !number?(char) && char != 'I' && char != '_'
  end
end

# Checks if character is a number
def number?(char)
  char =~ /[[:digit:]]/
end

# Sort text
def sort(text)
  list = []
  sorted = ''
  text.each_line do |line|
    list.push line
  end
  list.sort!

  list.each do |item|
    sorted += item
  end
  sorted
end

def wrap(text, tag)
  "<#{tag}>#{text}</#{tag}>"
end
