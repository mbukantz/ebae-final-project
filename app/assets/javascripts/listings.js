$(document).on('page:load ready', function(){
  console.log("bid submitted");
  $('.bid-submit').on('ajax:success', function(event, data, status, xhr){
    debugger;
    // $('#show-category-items-js').html(data.template);
    })
  })


