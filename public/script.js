function loadStaff() {
  $.get("/staff", function(data){
    $('.staff').html(data);
  });
}

$(function() {
    $('#load-staff').click(loadStaff);
});
