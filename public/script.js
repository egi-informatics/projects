function loadStaff() {
  $.ajax({
    url: "/staff",
    beforeSend: showSpinner,
    complete: hideSpinner,
    success: function(data){
      $('.staff').val(data.trim());
      auto_grow($('.staff').get(0));
    }
  });
}

var copyButton = "<button class='copy-button' type='button' data-clipboard-target='#staff'>Copy Text</button>";

function showSpinner(){
  $('.loading').removeClass('hidden');
}

function hideSpinner(){
  $('.loading').addClass('hidden');
}

function auto_grow(element) {
  element.style.height = "calc(" + (element.scrollHeight) + "px - 1em)";
}

$(function() {
  $('#load-staff').click(loadStaff);

  new Clipboard('.copy-button');
});
