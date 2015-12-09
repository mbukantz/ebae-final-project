$(document).on('page:load ready', function(){
  $('.dashboard-section').click(function(){
    var $this = $(this);
    debugger
    var content = $this.find('div')
    content.toggle();
  })
})
