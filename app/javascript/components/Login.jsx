import React from 'react';
import {Animated} from "react-animated-css";
import Logo from "images/logo.png";


class Login extends React.Component{

    constructor(props){
        super(props);
        this.state={
            isVisible: true,
        }

        this.toggleLogin = this.toggleLogin.bind(this);
    }


    toggleLogin = () => {
        this.setState({
          isVisible: !this.state.isVisible
        })
    }

    render (){
        return (
            <section id="login" className="blue-bg">
                <div className="container py-5">
                    {this.state.isVisible ?
                        <Animated animationIn="zoomIn" animationOut="zoomOut" isVisible={this.state.isVisible}>
                            <div className="row first-row-wrapper align-items-center">
                                <div className="col-sm col-lg-6 px-0 column-wrapper">
                                    <h2>Hello, Friend!</h2>
                                    <p>Enter your personal details
                                        and enjoy your event with us</p>
                                    <button className="btn-signup" onClick={this.toggleLogin}>Sign Up</button>
                                </div>
                                <div className="col-sm col-lg-6 px-0 column-wrapper">
                                    <img src={Logo} className="img-fluid mb-3" alt="logo"/>
                                    <form className="text-center">
                                        <div className="mb-3">
                                            <input type="text" className="form-control" id="username" placeholder="Username/Email"/>
                                        </div>
                                        <div className="mb-1">
                                            <input type="password" className="form-control" id="userPassword" placeholder="Password"/>
                                        </div>
                                        <div className="mb-0">
                                            <a type="submit" className="forgotPassword" href="#">Forgot your password?</a>
                                        </div>
                                        <button type="submit" className="btn btn-sign-in">Sign in</button>
                                    </form>
                                </div>
                            </div>
                        </Animated>
                    :
                        <Animated animationIn="zoomIn" animationOut="zoomOut" isVisible={!this.state.isVisible}>
                            <div className="row login-wrapper-hidden align-items-center">
                                <div className="col-sm-7 column-wrapper">
                                    <h2 className="mb-3">Create Account</h2>
                                    <form className="row text-center">
                                        <div className="mb-3 px-0">
                                            <input type="text" className="form-control" id="name" placeholder="Name"/>
                                        </div>
                                        <div className="mb-3 px-0">
                                            <input type="email" className="form-control" id="email" placeholder="Email"/>
                                        </div>
                                        <div className="mb-3 px-0">
                                            <input type="text" className="form-control" id="new_username" placeholder="Username"/>
                                        </div>
                                        <div className="mb-3 px-0">
                                            <input type="password" className="form-control" id="password" placeholder="Password"/>
                                        </div>
                                        <div className="mb-3 px-0">
                                            <input type="text" className="form-control" id="eventcode" placeholder="Event Code"/>
                                        </div>
                                        <div className="mb-0 px-0">
                                            <p className="px-0 my-0">Date of Birth</p>
                                        </div>
                                        <div className="mb-3 px-0 text-start col-wrapper">
                                            <div className="col-6 px-0">
                                                <label htmlFor="birthMonth" className="px-0">Month</label>
                                                <input type="month" className="form-control" id="birthMonth"/>
                                            </div>
                                            <div className="col-6 px-1">
                                                <label htmlFor="birthDay" className="px-0">Day</label>
                                                <input type="number" min="1" max="31"  placeholder="--" id="birthDay"/>
                                            </div>
                                        </div>
                                        <div className="row terms">
                                            <div className="col-6">
                                                <div className="form-check px-0">
                                                    <input type="checkbox" id="terms"/>
                                                    <label className="form-check-label px-1" htmlFor="terms">
                                                            I agree to the Terms of Service
                                                            and Privacy Policy.
                                                    </label>
                                                </div>
                                            </div>
                                            <div className="col-6">
                                                <button type="submit" className="btn btn-sign-in w-100">Sign up</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div className="col-sm-5 px-3 column-wrapper">
                                    <h2>Welcome Back!</h2>
                                    <p>If you are already registered
                                            and want to enter an event
                                            please login with your personal info</p>
                                    <button className="btn-signin" onClick={this.toggleLogin}>Sign In</button>
                                </div>
                            </div>
                        </Animated>
                    }
                </div>
            </section>
        );
    }
}


export default Login;
