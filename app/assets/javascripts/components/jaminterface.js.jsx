var JamInterface = React.createClass({
  render: function() {
    var chords = JSON.parse(this.props.chords)
    var chordNodes = chords.map(function (chord) {
      return (
        <span className="jam-chord col-xs-2">{chord}</span>
      );
    });
    return (
      <div className="jam-interface">
        <div className="row">
          <ChordList />
          <p>{chordNodes}</p>
          </div>
        <CurrentKey />
        <p>This is the interface</p>
      </div>
    );
  }
});

var CurrentKey = React.createClass({
  render: function() {
    return (
      <div className="current-key">
        <h3>CURRENT KEY: C</h3>
      </div>
    );
  }
});

var ChordList = React.createClass({
  render: function() {
    return (
      <h1>CHORDS</h1>
      );
    // var chordNodes = this.props.data.map(function (chord) {
    //   return (
    //     <CurrentChord chord={chord}>
    //       {chord}
    //     </CurrentChord>
    //   );
    // });
    // return (
    //   <div className="chordList">
    //     {chordNodes}
    //   </div>
  }
});


var CurrentChord = React.createClass({
  render: function() {
    return (
      <div className="current-chord">
      </div>
    );
  }
});

