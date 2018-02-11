
import React from 'react';
import ReactDOM from 'react-dom';

export default function init_names(root) {
  ReactDOM.render(<Names />, root);
}

class Names extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let names = ["Alice", "Carol"].map( nn => <li key={ nn }>{ nn }</li> );
    return <ul>
      { names }
    </ul>;
  }
};

