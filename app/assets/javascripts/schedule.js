$(document).ready(function(){
  $(".new_appt").on("click", function(event){
    event.preventDefault();

    var that = $(this).find(".hidden");

    that.removeClass("hidden");
    that.addClass("active");

  });

  $(".appt_close").on("click", function(){
    var that = $(document).find(".active");
    that.removeClass("active");
    that.css("display", "none");
  });
});

