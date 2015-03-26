$( document ).ready(function() {
  $("#hero").backstretch([
    "/assets/anniversary.png",
    "/assets/basic.jpg",
    "/assets/congratulations.png",
    "/assets/anniversary.png",
    "/assets/sympathy.png"  
  ], {duration: 4000,
      fade: 'slow'
  });

  $(window).on("backstretch.before", function (e, instance, index) {
    // If we wanted to stop the slideshow after it reached the end
    if (index === 0) $("#hero").removeClass("sympathy").addClass("anniversary");
    if (index === 1) $("#hero").removeClass("anniversary").addClass("basic");
    if (index === 2) $("#hero").removeClass("basic").addClass("congratulations");
    if (index === 3) $("#hero").removeClass("congratulations").addClass("anniversary");
    if (index === 4) $("#hero").removeClass("anniversary").addClass("sympathy");
  });
});
