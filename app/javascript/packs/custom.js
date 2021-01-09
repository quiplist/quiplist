$( document ).ready(function() {

  $(".first-row-wrapper .btn-signup").on('click', function(){
    $(".first-row-wrapper").addClass('hideClass');
    $(".login-wrapper-hidden").addClass('showClass');
    $(".login-wrapper-hidden").removeClass('hideClass');
  })

  $(".login-wrapper-hidden .btn-signin").on('click', function(){
    $(".login-wrapper-hidden").removeClass('showClass');
    $(".login-wrapper-hidden").addClass('hideClass');
    $(".first-row-wrapper").removeClass('hideClass');
  })


  function menuOnClick() {
    document.getElementById("menu-bar").classList.toggle("change");
    document.getElementById("nav").classList.toggle("change");
    document.getElementById("menu-bg").classList.toggle("change-bg");
  }

  // new Wheel({
  //   el: document.getElementById('wheel'),
  //   data: [{
  //     text: 'Beijing',
  //     color: 'silver',
  //     fontSize: 24
  //   },
  //   {
  //     text: 'London',
  //     fontColor: '#008000'
  //   },
  //   'New York',
  //   'Tokyo'
  // ],
  //   theme: 'light',
  //   radius: 150,
  //   buttonWidth: 75,
  //   color: {
  //     button: '#fef5e7',
  //     buttonFont: '#34495e'
  //   },
  //   onSuccess(data) {
  //     console.log(data.text);
  //     Swal.fire({
  //       title: data.text,
  //     })
  //   }
  // });
});
