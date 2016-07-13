function loadInto(element, page, loading) {
  $.ajax({
    url: page,
    success: function(data) {
      $(element).html(data);
    },
    complete: function() {
      $(loading).addClass('hidden');
      launchCompare();
    }
  });
}

function auto_grow(element) {
  element.style.height = "calc(" + (element.scrollHeight) + "px - 1em)";
}

$(function() {
  $('#load-staff').click(function() {
    loadInto('.content', '/staff');
  });
  $('#load-projects').click(function() {
    loadInto('.content', '/projects');
  });

  new Clipboard('.copy-button');
});

function launchCompare() {
  numLeft = $('.loading').not('.hidden').length;

  if (numLeft > 0) {
    console.log("Still Loading: " + numLeft);
    return;
  }
  console.log("Done Loading");
  compare();
}

function compare(){
  sources = [$('#json-text').find('table').eq(0), $('#below-text').find('table').eq(0), $('#pages-text').find('table').eq(0)];
  for(var i = 0; i < sources.length; i++){
    var source = sources[i];
    add(source);
    remove(source);
    if(i != 1){
      modify(source);
    }
  }
}

function add(source){
  source.closest('div').append("<h4>Add</h4>");
  var output = "";
  $('#rp-text').find('td:first-child').each(function() {
    var current = $(this).text();
    var exists = false;
    source.find('td:first-child').each(function() {
      if ($(this).text() == current) {
        exists = true;
        return;
      }
    });
    if (!exists) {
      output += "<tr class='add'><td>" + current + "</td></tr>";
    }
  });
  output = "<table><tbody>" + output + "</tbody></table>";
  source.closest('div').append(output);
}

function remove(source){
  source.closest('div').append("<h4>Remove</h4>");
  var output = "";
  source.find('td:first-child').each(function() {
    var current = $(this).text();
    var found = false;
    $('#rp-text').find('td:first-child').each(function() {
      if ($(this).text() == current) {
        found = true;
        return;
      }
    });
    if (!found) {
      output += "<tr class='remove'><td>" + current + "</td></tr>";
    }
  });
  output = "<table><tbody>" + output + "</tbody></table>";
  source.closest('div').append(output);
}

// var demoNum = 0;
function modify(source){
  // demoNum++;
  source.closest('div').append("<h4>Modify</h4>");
  var output = "";
  source.find('td:first-child').each(function() {
    var s_num = $(this);
    $('#rp-text').find('td:first-child').each(function() {
      var rp_num = $(this);
      if (s_num.text() == rp_num.text()) {
        // if(demoNum == 2){
        //   alert(s_num.text() + " " + rp_num.text());
        // }
        if(s_num.next().text() != rp_num.next().text()){
          output += "<tr class='modify'><td>" + s_num.text() + "</td>" + "<td>" + rp_num.next().text() + "</td></tr>";
        }
      }
    });
  });
  output = "<table><tbody>" + output + "</tbody></table>";
  source.closest('div').append(output);
}
