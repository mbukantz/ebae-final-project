$(function(){
  $('.dashboard-section').click(function(){
    var $this = $(this);
    var content = $this.find('div')
    content.toggle();
  })
})
