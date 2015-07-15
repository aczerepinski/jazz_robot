$(document).on('ready page:load', function(){
  if ($(".game-board").length > 0){
    var game = new GameState;
    game.init();
    game.answerListener();
  }
});

var GameState = function(){
  return {
    init: function(){
      this.getData();
      this.play();
    },
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
    renderQuestionNumber: function(){
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
          self.renderQuestionData();
        } 
      });
    },
    renderQuestionData: function(){
      var i = this.question - 1;
      $('#questionKey').text(this.data[i][0]);
      $('#questionChord').text(this.data[i][1]);
    },
    answerListener: function(){
        var self = this;
      $('.game-answer-submit').on('click', function(e){
        e.preventDefault();
        var userAnswer = $('.game-answer-input').val().toLowerCase();
        (self.answerIsCorrect(userAnswer)) ? self.correctAnswer() : self.wrongAnswer();
        self.question += 1;
        self.play();
      });
    },
    answerIsCorrect: function(userAnswer){
      var i = this.question - 1;
      var correctAnswer = this.data[i][2].toLowerCase();
      return userAnswer === correctAnswer;
    },
    play: function(){
      if (this.question === 11){
        this.renderScore();
        this.showNextLevelButton();
      }else if (this.question === 1){
        this.renderScore();
        this.renderQuestionNumber();
      }else{
        this.renderQuestionData();
        this.renderScore();
        this.renderQuestionNumber();
      }
    }
  };
}