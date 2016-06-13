require_relative 'research_portfolio'
require_relative 'json'

def projects
  page = load_rp

  page +=
    "<div class='json area'><h3>Map JSON Data</h3>" +
    "<button id='json-button'>Load Map JSON Data</button>" +
    "<div id='json-text'></div></div>" +
    "<div class='below area'><h3>Text Below Map</h3>" +
    "<button id='below-button'>Load Text Below Map</button>" +
    "<div id='below-text'></div></div>" +
    "<script>$('#json-button').click(function(){loadInto('#json-text', '/json');$('#json-button').hide()});</script>" +
    "<script>$('#below-button').click(function(){loadInto('#below-text', '/below-map');$('#below-button').hide()});</script>"

  return page
end
