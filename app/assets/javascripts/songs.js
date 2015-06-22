$(document).on('page:load', function(){
  keyListener();
});

var keyListener = function(){
  $("#keys .btn").on('click', function(){
    var key = $(this).text().toLowerCase();
    displayNewKey(key);
  })
}

var displayNewKey = function(newKey){
  $.ajax({
  url: "/songs/1",
  data: {key: newKey}
}).done(function(response) {
  debugger;
  $(".chords").html(response);
});

}