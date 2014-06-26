$(document).ready(function(){
  $(".new_mentor_availibility").on("click", function(event) {
    $("#start_time").text($(this).text());
    $('#new_appointment').modal('show');
  });

  $("#create_appt").on("click", function(){
    $("input[name='start_time']").val($("#start_time").text());
    $("#create_appt_form").submit();
  });
});
