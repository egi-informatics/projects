function loadStaff() {
  $.ajax({
    url: "/staff",
    beforeSend: showSpinner,
    complete: hideSpinner,
    success: function(data){
      $('.staff').html(data)
    }
  });
}

function showSpinner(){
  $('.loading').removeClass('hidden');
}

function hideSpinner(){
  $('.loading').addClass('hidden');
}

$(function() {
    $('#load-staff').click(loadStaff);
});
