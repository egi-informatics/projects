require_relative 'research_portfolio'
require_relative 'json'

def projects
  page = load_rp

  page +=
    "<div class='json area'><h3>Map JSON Data</h3>" +
    "<button id='json-button'>Load Map JSON Data</button>" +
    "<div id='json-text'></div></div>" +
    "<script>$('#json-button').click(function(){loadInto('#json-text', '/json');$('#json-button').hide()});</script>"

  return page
end
