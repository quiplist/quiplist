import React from 'react';

class HomeEventCode extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      eventCode: '',
      isTermChecked: false,
      event: {}
    };

    this.handleInputChange = this.handleInputChange.bind(this);
    this.onClickTerm = this.onClickTerm.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInputChange(event) {
    this.setState({eventCode: event.target.value});
  }
  // NOTE: if many input
  // handleInputChange(event) {
  //   const target = event.target;
  //   const value = target.value;
  //   const name = target.name;
  //
  //   this.setState({
  //     [name]: value
  //   });
  // }

  onClickTerm(event) {
    this.setState({ isTermChecked: event.target.value });
  }

  handleSubmit(event) {
    const url = "/api/v1/events/find_by_event_code?event_code=";
    const eventCode = this.state.eventCode;

    // axios.get('/api/v1/events/find_by_event_code?event_code=' + this.state.eventCode)
    // .then(response => {
    //   this.setState({event: response});
    //   console.log(response);
    // });

    // axios({
    //   method: 'get', //you can set what request you want to be
    //   url: url + eventCode,
    //   headers: {
    //     //Authorization: 'Bearer ' + varToken
    //     'Content-Type': "application/json"
    //   }
    // }).then(response => {
    //   this.setState({event: response});
    //   console.log(response);
    // }).catch(error => console.log(error.message));

    // fetch(url + eventCode, {
    //   method: "GET",
    //   headers: {
    //     //"Authorization": "",
    //     "Content-Type": "application/json"
    //   }
    // }).then(response => {
    //   this.setState({event: response});
    //   console.log(response);
    //   console.log(this.state.event);
    // }).then(response =>{
    //     //redirect
    // }).catch(error => console.log(error.message));
      // .then(res=>( console.log(res)))
      // .catch( error => console.log(error))
    event.preventDefault();
  }

  render (){
    return (
      <section id="section2" className="blue-bg py-3">
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
              <form className="event-code-wrapper mb-3" onSubmit={this.handleSubmit}>
                  <input type="text" placeholder="Event Code:" name="eventCode" value={this.state.eventCode} onChange={this.handleInputChange }/>
                  <label htmlFor="eventCode">
                      Please enter your unique code here. This code is exclusive
                      and can only be used once and during the event phase only.
                      Sharing this code may cost you to lose your event access.
                  </label>
                  <div className="row justify-content-end align-items-center mt-2">
                      <div className="col-9">
                          <div className="form-check px-0">
                              <input type="checkbox" name="isTermChecked" checked={this.state.isTermChecked} onChange={this.onClickTerm}/>
                              <label className="form-check-label px-1" htmlFor="terms">
                                  I agree to the Terms of Service
                                  and Privacy Policy.
                              </label>
                          </div>
                      </div>
                      <div className="col-3 text-end">
                          <button type="submit" className="btn btn-primary" disabled={!this.state.isTermChecked}>Join</button>
                      </div>
                  </div>
              </form>
          </div>
      </section>
    );
  }
}
export default HomeEventCode;
