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

}
