$(document).on('page:load ready', function(){
  $('.category-btn').click(function(){
    console.log("here");
    var $this = $(this);
    var categoryId = $this.attr('id');
    var url = '/categories/' + categoryId;
    $.ajax({
      url: url,
      dataType: "json",
      method: "GET"
    }).success(function(data){
      $('#show-category-items-js').html(data.template);
    })
  })
})


