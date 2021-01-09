// import React from "react";
// import Routes from "../routes/Index";
//
// export default props => <>{Routes}</>;

import React, { Component } from "react";
import { BrowserRouter as BrowserRouter, Switch, Route } from "react-router-dom";
import BlankLayout from "../layout/BlankLayout";
import PrimaryLayout from "../layout/PrimaryLayout";
class App extends Component {
  constructor(){
    super();
    this.state = {
      currentUser: null
    }
    this.updateCurrentUser = this.updateCurrentUser.bind(this);
  }
  componentDidMount(){
      const url = "/api/v1/users/check_for_user";

      fetch(url).then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      }).then(response => {
        console.log("==========" + response);
        if(response) {
          this.setState({ currentUser: response });
        } else {
          that.setState({ currentUser: null });
        }
      }).catch(error => {
          console.log(error.message);
          // this.props.history.push("/");
      });
    }
  updateCurrentUser(user) {
      this.setState({
        currentUser: user
      })
    }

  render(){
    return(
      <div className="App">
        <BrowserRouter>
          <Switch>
            <Route exact path="/" render={(props) => <PrimaryLayout {...props} /> } />
            <Route exact path="/:eventCode/login" render={(props) => <PrimaryLayout {...props} /> } />
            // <Route exact path="/randompicker" render={(props) => <BlankLayout/> } />
            // <Route exact path="/admin/login" render={(props) => <BlankLayout {...props} /> } />
            // <Route exact path="/admin/dashboard" render={(props) => <BlankLayout/> } />
           </Switch>
        </BrowserRouter>
      </div>
    )
 }
}

export default App;
