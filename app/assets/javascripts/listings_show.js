$(document).on('page:load ready', function(){
  $('#picture-form-2').hide();
  $('#picture-form-3').hide();
  $('#picture-form-4').hide();
  $('#picture-form-5').hide();

  $('#picture-button').click(function(){
    var lastShowing = $('[id*="picture-form"]:visible').last().attr("id");
    var number = parseInt(lastShowing[lastShowing.length - 1]) + 1
    $('#picture-form-' + number).show();
    if (number === 5){
      $('#picture-button').hide();
    }
  });
})
