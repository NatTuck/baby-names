
import React from 'react';
import ReactDOM from 'react-dom';
import { FormGroup, Input } from 'reactstrap';

export default function init_names(channel, root) {
  ReactDOM.render(<NamesRoot channel={channel} />, root);
}

class NamesRoot extends React.Component {
  constructor(props) {
    super(props);
    this.channel = props.channel;
    this.state = {
      names: [],
    };
  }

  search() {
    let query = $('#search-box').val();
    console.log("query", query);
    this.channel.push("search", { query: query })
        .receive("ok", (resp) => { this.setState({ names: resp.names }); })
        .receive("error", (resp) => { console.log("Error", resp);  });
  }

  rate(name, kind, value) {
    console.log("rating", kind, value);
    this.channel.push("rate", { name: name, kind: kind, value: value })
        .receive("ok", (resp) => { console.log("ok"); this.search(); })
        .receive("error", (resp) => { console.log("Error", resp);  });
  }

  render() {
    let root = this;
    let search = this.search.bind(this);

    function gotKey(ev) {
      //if (ev.key == "Enter") {
      //  search();
      //}
    }

    let names = this.state.names.map( nn =>
      <Name key={nn.name} name={nn} root={this} />
    );
    return (
      <div>
        <p>
          <input type="text" id="search-box" onChange={search} onKeyPress={gotKey} />
        </p>
        <table className="table table-striped">
          <thead>
            <tr>
              <th>Name</th>
              <th>Peak Year</th>
              <th>Peak Rank</th>
              <th>Rank 2016</th>
              <th>Proj 2018</th>
              <th>K Rating</th>
              <th>N Rating</th>
            </tr>
          </thead>
          <tbody>
            { names }
          </tbody>
        </table>
      </div>
    );
  }
};

function Name(props) {
  let obj = props.name;
  let root = props.root;

  return <tr>
    <td>{ obj.name }</td>
    <td>{ obj.best_year }</td>
    <td>{ obj.best_rank }</td>
    <td>{ obj.rank_2016 }</td>
    <td>{ obj.proj }</td>
    <td><Rating kind="k" name={obj.name} value={obj.krat} root={root} /></td>
    <td><Rating kind="n" name={obj.name} value={obj.nrat} root={root} /></td>
  </tr>;
}

function Rating(props) {
  let name = props.name;
  let value = props.value || "";
  let kind = props.kind;

  let options = _.map(_.range(1, 6), (nn) => {
      return <option key={nn}>{ nn }</option>;
  });

  function changed(ev) {
    props.root.rate(name, kind, $(ev.target).val());
  }

  return <FormGroup>
    <Input type="select" onChange={changed} value={value}>
      <option></option>
      { options }
    </Input>
  </FormGroup>
}

