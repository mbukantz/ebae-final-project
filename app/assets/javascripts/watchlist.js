var listenToWatchButton = function(){
  $("body").on('click','#watch-button',function(){
    console.log("Watch clicked");
    var $this = $(this);
    var url = '/watchlists/';
    var id = $this.parent().attr("id")
    $.ajax({
      url: url,
      type: "POST",
      data: {listing_id: id}
    }).success(function(data){
      $('#watchlist-counter').html(data.template);
    })
  })
}

var listenToUnwatchButton = function(){
   $("body").on('click','#unwatch-button',function(){
    console.log("unWatch clicked");
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
}

$(document).on('page:load ready', listenToWatchButton);
$(document).on('page:load ready', listenToUnwatchButton);

// $(document).on('page:load ready', function(event){
//   console.log("page ready");
//   listenToWatchButton();
//   listenToUnwatchButton();
// })

// $(document).on('page:change', function(event) {
//   console.log("partial change");
//   listenToWatchButton();
//   listenToUnwatchButton();
// });

