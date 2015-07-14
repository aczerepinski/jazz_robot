$(document).on('ready page:load', function(){
  if ($(".game-board").length > 0){
    var game = new GameState;
    game.getData();
    game.play();
  }
});

var GameState = function(){
  return {
    score: 0,
    renderScore: function(){
      $('#score').text(this.score);
    },
    correctAnswer: function(){
      this.score += 100;
    },
    wrongAnswer: function(){
      this.score -= 25;
    },
    question: 1,
    renderQuestion: function(){
      $('#questionNumber').text(this.question)
    },
    showNextLevelButton: function(){
      $('.btn-next-level').removeClass('hidden');
    },
    data: [],
    getData: function(){
      var self = this;
      $.ajax({
        type: "GET",
        url: window.location.href + ".json",
        dataType: "json",
        success: function(data){
          self.data = data;
        } 
      });
    },
    play: function(){
      if (this.question === 11){
        this.renderScore();
        this.showNextLevelButton();
      }else{
        this.renderScore();
        this.renderQuestion();
      }
    }
  };
}