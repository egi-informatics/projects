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

function showSpinner(){
  $('.loading').removeClass('hidden');
}

function hideSpinner(){
  $('.loading').addClass('hidden');
}

function auto_grow(element) {
  element.style.height = (element.scrollHeight)+"px";
}

$(function() {
    $('#load-staff').click(loadStaff);
});
