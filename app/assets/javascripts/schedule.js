$(document).ready(function(){
  $(".new_appt").on("click", function(event) {
    $("#start_time").text($(this).text());
    $('#new_appointment').modal('show');
  });
});
