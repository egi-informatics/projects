def load_pages
  main_url = 'https://egi.utah.edu/all/?mode=quick'
  main_text = URI.parse(main_url).read

  projects = []

  main_text.each_line do |line|

    projects.push line[/(?<=href=\").+(?=\")/] if line.include? "href="
  end

  projects.to_s
end
