var JamTitle = React.createClass({
  render: function() {
    return (
      <div className="jamtitle">
        <h1>JAM MODE: {this.props.name}</h1>
      </div>
    );
  }
});