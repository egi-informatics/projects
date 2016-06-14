def load_pages
  main_url = 'https://egi.utah.edu/all/?mode=quick'
  main_text = URI.parse(main_url).read

  projects = []

  main_text.each_line do |line|
    projects.push line[/(?<=href=\").+(?=\")/] + "?mode=quick" if line.include? "href="
  end

  output = ""

  projects.each do |project_url|
    text = URI.parse(project_url).read

    number = project_url.split("/")[-2].gsub("i", "I")
    next unless number.include? "I0"

    text.each_line do |line|
      next unless line.include? "</h1>"

      status = line[/(?<=float: right;\">).+(?=<\/span>)/]
      status = "Development" if status.include? "Dev"
      status = "Completed" if status.include? "Comp"
      status = "Progress" if status.include? "Prog"

      output += "<tr><td>#{number}</td><td>#{status}</td></tr>" + "\n"
      break
    end
  end

  output = sort(output)
  output = wrap(output, "table")
end
