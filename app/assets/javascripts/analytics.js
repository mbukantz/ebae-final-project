$(document).on('page:load ready', function(){
  console.log("hello");
 var makeBarGraph = function(data){
      // debugger;
   var chart = d3.select('#bar-chart-js');
   var bar = chart.selectAll('div');
   var barLength = bar.data(data);
   var addBar = barLength.enter().append('div').attr('class', 'bar');
   addBar.style('width', function(d){
     return d*10 + 'px';
   });
   addBar.text(function(d){
     return d;
   })
 }
 // var data = [1, 4, 3, 2];
 // debugger;
 


 // debugger;
 // var x = d3.scale.linear()
 //     .domain([0, d3.max(data)])
 //     .range([0, 40]);
 

 

 var getCategories = function(cb){
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

       cb(counts); // callback
     })
   }


 getCategories(makeBarGraph);



});