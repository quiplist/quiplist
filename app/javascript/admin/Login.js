import React from 'react';
import Logo from "images/logo.png";

class AdminLogin extends React.Component{
    render (){
        return(
            <div id="admin-login__wrapper" className="container">
                <div className="row">
                    <div className="col-12">
                        <img className="img-fluid" src={Logo} alt="logo"></img>
                    </div>
                </div>
            </div>
        );
    }
}

export default AdminLogin;
