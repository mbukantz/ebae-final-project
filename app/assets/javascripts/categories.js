$(function(){
  $('.category-btn').click(function(){
    console.log("here");
    var $this = $(this);
    var categoryId = $this.attr('id');
    var url = '/categories/' + categoryId;
    $.ajax({
      url: url, 
      dataType: "json",
      method: "GET"
    }).success(function(){
      debugger;
    })
    // $.getJSON('/categories/' + categoryId + '.json', function(data){
    //   debugger;
    // } )
  })
})
