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
      this.setScore();
      this.play();
    },
    score: 0,
    setScore: function(){
      var query = window.location.search.substring(1);
      if((query.length > 0) && (query.substring(0,6) === "score=")){
        this.score = parseInt(query.substring(6));
      }
    },
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
      var sharpAnswer = correctAnswer.replace('db','c#').replace('eb','d#').replace('gb','f#').replace('ab','g#').replace('bb', 'a#');
      var flatAnswer = correctAnswer.replace('c#','db').replace('d#','eb').replace('f#','gb').replace('g#','ab').replace('a#', 'bb');
      return ((userAnswer === correctAnswer) || (userAnswer === sharpAnswer) || (userAnswer === flatAnswer));
    },
    updateUrl: function(){
      var self = this;
      var url = $('.btn-next-level a').attr('href', function(i, url){
        return url + '?score=' + self.score;
      });
    },
    play: function(){
      if (this.question === 11){
        this.renderScore();
        this.updateUrl();
        this.showNextLevelButton();
      }else if (this.question === 1){
        this.renderScore();
        this.renderQuestionNumber();
      }else{
        this.renderQuestionData();
        this.renderScore();
        this.renderQuestionNumber();
        $('.game-answer-input').val('');
      }
    }
  };
}