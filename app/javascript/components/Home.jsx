import React from 'react';
import Placeholder1 from "images/placeholder1.jpg";
import Placeholder2 from "images/placeholder2.jpg";
import Placeholder3 from "images/placeholder3.jpg";
import Top from "images/top.png";
import Bottom from "images/bottom.png";

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      checked: false,
      eventCode: ""
    };

    this.handleCheck = this.handleCheck.bind(this);
    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
    this.stripHtmlEntities = this.stripHtmlEntities.bind(this);
  }

  stripHtmlEntities(str) {
    return String(str)
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;");
  }

  handleCheck = () => {
    this.setState({checked: !this.state.checked});
  }

  onChange(event) {
    this.setState({ [event.target.name]: event.target.value });
  }

  onSubmit(event) {
    event.preventDefault();
    const eventCode = this.state.eventCode;
    const url = `/api/v1/events/find_by_event_code/${eventCode}`;

    if (eventCode.length == 0)
      return;

    fetch(url).then(response => {
      if (response.ok) {
        return response.json();
      }
      throw new Error(response);
    }).then(response => {
      this.props.history.push(`/events/${eventCode}/login`);
    }).catch(error => console.log(error));
  }

  render (){
    return (
      <div className="home">
        <section id="section1">
            <div id="sliderIndicators" className="carousel slide" data-bs-ride="carousel">
                <div className="carousel-inner">
                  <div className="carousel-item active">
                    <img src={Placeholder1} className="d-block w-100" alt="placeholder1" />
                  </div>
                  <div className="carousel-item">
                    <img src={Placeholder2} className="d-block w-100" alt="placeholder2"/>
                  </div>
                  <div className="carousel-item">
                    <img src={Placeholder3} className="d-block w-100" alt="placeholder3"/>
                  </div>
                </div>
            </div>
        </section>
        <section id="section2" className="blue-bg_home py-3">
            <div className="overlap_top-bg"><img src={Top} alt="top" className="img-fluid"></img></div>
            <div className="container">
                <div className="row text-center py-5">
                    <div className="col col-lg-12">
                        <h1>Welcome!</h1>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
                            minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in
                            vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
                            delenit augue duis dolore te feugait nulla facilisi.</p>
                        <p>Click <a href="login.html">here</a> to login and join an event.</p>
                    </div>
                </div>
                <form className="event-code-wrapper mb-3" onSubmit={this.onSubmit}>
                    <input type="text" placeholder="Event Code:" id="eventCode" name="eventCode" required onChange={this.onChange}/>
                    <label htmlFor="eventCode" >
                        Please enter your unique code here. This code is exclusive
                        and can only be used once and during the event phase only.
                        Sharing this code may cost you to lose your event access.
                    </label>
                    <div className="row justify-content-end align-items-center mt-2">
                        <div className="col-9 text-start">
                            <div className="form-check px-0">
                                <input type="checkbox" id="terms" onChange={this.handleCheck} defaultChecked={this.state.checked}/>
                                <label className="form-check-label px-1" htmlFor="terms">
                                    I agree to the Terms of Service
                                    and Privacy Policy.
                                </label>
                            </div>
                        </div>
                        <div className="col-3 text-end">
                            { this.state.checked ? <button type="submit" className="btn btn-event-code">Join</button> : <button type="submit" className="btn btn-event-code" disabled>Join</button> }
                        </div>
                    </div>
                </form>
            </div>
            <div className="overlap_bottom-bg"><img src={Bottom} alt="top" className="img-fluid"></img></div>
        </section>
      </div>
    );
  }
}
export default Home;
