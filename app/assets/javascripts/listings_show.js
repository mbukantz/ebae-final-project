$(document).on('page:load ready', function(){
  $(".form-group-watch").on('click','.watchlist-button-watch',function(){
    var $this = $(this);
    var url = '/watchlists/';
    var listing = $this.attr('id');
    $.ajax({
      url: url,
      type: "POST",
      data: {listing_id :listing}
    }).success(function(data){
      $('#watchlist-counter').html(data.template);
    })
  })
  $(".form-group-unwatch").on('click','.watchlist-button',function(){
    var $this = $(this);
    var id = $this.parent().attr("id")
    var url = '/watchlists/' + id;
    $.ajax({
      url: url,
      type: "DELETE",
    }).success(function(data){
      $('#watchlist-counter').html(data.template);
    })
  })
})
