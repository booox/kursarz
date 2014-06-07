$(document).ready(function() {

  if(window.isSignedUpForCourse) {
    $('#show_description').click(function() {
      $('#course_description').animate({height:"toggle"});
    });
  } else {
    $('#course_description').show()
  }
});
