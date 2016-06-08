function loadStaff() {
  $.get("/staff", function(data){
    $('.staff').html(data);
  });
}

$(function() {
    $('#view-staff').click(loadStaff);
});
