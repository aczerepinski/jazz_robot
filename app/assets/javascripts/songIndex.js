
$(document).on('ready page:load', function(){
  categoryFilterListener();
  songButtonListener();
});

// This listens for clicks on the Composer/Genre/Difficulty nav tabs and reveals
// buttons assosciated with those categories
var categoryFilterListener = function() {
  $('.filter-category').on('click', function(e) {
    e.preventDefault();
    var clickedTab = $(this);
    var category = clickedTab.find('a').text().toLowerCase();
    $('.filter-category').removeClass('active');
    clickedTab.addClass('active');
    hideButtons();
    showButtons(category);
  });
}

var hideButtons = function() {
  $('.btn-filter').addClass('hidden');
}

var showButtons = function(category) {
  $('.' + category).removeClass('hidden');
}

// This listens for clicks on the category specific buttons and filters songs
// by category (i.e. medium difficulty, composed by Monk, etc)
var songButtonListener = function() {
  $('.btn-filter').on('click', function(e) {
    e.preventDefault();
    var clickedButton = $(this);
    var dataCategory = clickedButton.data('category');
    var buttonCategory = clickedButton.text().toLowerCase();
    hideSongs();
    showSongs(buttonCategory, dataCategory);
  })
}

var hideSongs = function() {
  $('.song-link').addClass('hidden');
}

var showSongs = function(buttonCategory, dataCategory) {
  $(".song-link[data-" + dataCategory +"*='" + buttonCategory +"']").removeClass('hidden');
}
