var ready = function(){
  $(".new_mentor_availibility").on("click", function(event) {
    $("#start_time").text($(this).text());
    $('#new_appointment').modal('show');
  });

  $("#create_appt").on("click", function(){
    $("input[name='start_time']").val($("#start_time").text());
    $("#create_appt_form").submit();
  });

  $(".cancelAppointment").on("click", function(event){
    event.preventDefault();
    $("#edit_appt").attr("data-id", $(this).attr("data-id"));
    $("#edit_appt_label").text("Cancel Appointment");
    $("#edit_appt").text("Cancel Appointment");
    $("#edit_text").text("Click 'Cancel Appointment' to make this availability open for someone else");
    $("input[name='type']").val("cancel");
    $('#edit_appointment').modal('show');
  });

  $(".bookAppointment").on("click", function(event){
    event.preventDefault();
    $("#edit_appt").attr("data-id", $(this).attr("data-id"));
    $("#edit_appt_label").text("Book Appointment");
    $("#edit_appt").text("Book Appointment");
    $("#edit_text").text("Click 'Book Appointment' to pair with this person.");
    $("input[name='type']").val("book");
    $('#edit_appointment').modal('show');
  });

  $("#edit_appt").on("click", function(){
    $("#edit_appt_form").attr("action", "/appointments/" +  $(this).attr("data-id"));
    $("#edit_appt_form").submit();
  });

  $(".deleteAvailability").on("click", function(event){
    event.preventDefault();
    $("#delete_avail").attr("data-id", $(this).attr("data-id"));
    $('#delete_availability').modal('show');
  });

  $("#delete_avail").on("click", function(){
    $("#delete_appt_form").attr("action", "/appointments/" +  $(this).attr("data-id"))
    $("#delete_appt_form").submit();
  });

  $("#help_popover").popover({
    html : true,
    content: function() {
      return $('#help_content').html();
    },
    title: "Legend",
    placement: "bottom"
  });

  $("#edit_description").on("click", function(event){
    event.preventDefault();
    $("p#description").hide();
    $("#edit_description").hide();
    $("textarea[name='description']").val($("p#description").text());
    $("#edit_form").removeClass("hidden");
  });

  $("#edit_form").on("submit", function(event){
    event.preventDefault();
    var description = $("textarea[name='description']").val();

    $.ajax({
      url: $(this).attr("action"),
      type: "POST",
      data: {description: description, _method: "PUT"},
      success: function(response) {
        $("p#description").text(response.description);
        $("#edit_form").addClass("hidden");
        $("p#description").show();
        $("#edit_description").show();
      }
    });
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);
