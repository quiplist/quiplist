import React from "react";
import { BrowserRouter as Switch, Route } from "react-router-dom";
//import RandomPicker from "../components/raffles/RandomPicker";
import AdminLogin from "../admin/Login";

class BlankLayout extends React.Component {
    render () {
        return (
            <div>
                <Switch>
                  <Route exact path="/admin/login" render={(props) => <AdminLogin {...props} /> }/>
                </Switch>
            </div>
        );
    }
}



export default BlankLayout;
