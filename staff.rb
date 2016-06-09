def staff
  # url = "https://rawgit.com/spencerlarry/2a01b56ffe8121c94179d65a6528a997/raw/91cfa2ae45c8dd52d302f2e09407833cffc3b757/test-for-ruby.html"
  url = "http://egi.utah.edu/about/staff/?mode=quick"

  text = URI.parse(url).read

  output =
    "<div><h3 style='display: inline-block;'>Staff Members</h3><button class='copy-button' type='button' data-clipboard-target='#staff-text'>" +
      "<img src='/clippy.svg' width='15'  alt='Copy to Clipboard'/>" +
    "</button>" +
    "<textarea id='staff-text'>"

    text.each_line do |line|
      if line.include? "class=\"staff\">"
        cleaning = line.split("class=\"staff\"\>")[1]
        result = cleaning.split("<br/>")[0]
        output += "#{result}\n"
      end
    end

    output += "</textarea></div>" +
    "<script>auto_grow($('#staff-text').get(0));</script>"

  return output
end
