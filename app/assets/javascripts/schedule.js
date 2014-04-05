$(document).ready(function(){
  $(".new_mentor_availibility").on("click", function(event) {
    $("#start_time").text($(this).text());
    $('#new_appointment').modal('show');
  });
});
