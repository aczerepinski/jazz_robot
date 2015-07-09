$(document).ready(function() {

  categoryFilterListener();

});

var categoryFilterListener = function() {
    $('.filter-category').on('click', function(){
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

var songButtonListener = function() {

}