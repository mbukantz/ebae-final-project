$(function(){


  // var data = [1, 4, 3, 2];
  // debugger;
  
  var data =  function returnData(data){
      return data;
    }
  getCategories();  
       // $.getJSON('/analytics.json', function(response){
       //    var categories_count = response.categories_count;
       //    var counts = []
       //    // var categoriesObj = {}
       //    // for (var i = 0; i < categories_count.length; i++){
       //    //   categoriesObj[categories_count[i][0]] = categories_count[i][1];
       //    // }
       //    for (var i = 0; i < categories_count.length; i++){
       //      counts.push(categories_count[i][1]);
       //    }
       //    // debugger;
       //  returnData(counts);
       //  })

  // debugger;
  // var x = d3.scale.linear()
  //     .domain([0, d3.max(data)])
  //     .range([0, 40]);
  var chart = d3.select('#bar-chart-js');
  var bar = chart.selectAll('div');
  var barLength = bar.data(data);
  var addBar = barLength.enter().append('div').attr('class', 'bar');
  addBar.style('width', function(d){
    return x(d) + 'px';
  });
  addBar.text(function(d){
    return d;
  })

   

   function getCategories(){
      $.getJSON('/analytics.json', function(response){
        var categories_count = response.categories_count;
        var counts = []
        // var categoriesObj = {}
        // for (var i = 0; i < categories_count.length; i++){
        //   categoriesObj[categories_count[i][0]] = categories_count[i][1];
        // }
        for (var i = 0; i < categories_count.length; i++){
          counts.push(categories_count[i][1]);
        }
        returnData(counts);
      })
    }


  





});




