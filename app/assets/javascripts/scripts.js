// Have alterts and notices fade out slowly
$( document ).on('turbolinks:load', function() {
  $(".alert").delay(3000).fadeOut('slow');
})

