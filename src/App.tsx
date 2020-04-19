import React from 'react';
import logo from './logo.svg';
import './App.css';
import ButtonAppBar from './ButtonAppBar';

function App() {
  return (
    <div className="App">
      <ButtonAppBar />
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

let Application = App;

if (process.env.NODE_ENV === 'development') {
  const { hot } = require('react-hot-loader/root');
  Application = hot(App);
}

export default Application;
