$(document).on('page:load ready', function(){
  $('.watchlist-btn').click(function(){
    var $this = $(this);
    var url = '/watchlists/';
    var listing = $this.attr('id');
    $.ajax({
      url: url,
      type: "POST",
      data: {listing_id :listing}
    }).success(function(data){
      $('#watchlist-output').html(data.template);
    })
  })
})
