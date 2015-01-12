// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap

var data_time = 1370044800;
$(function(){
  var chartData = [{
    label: 'Layer 1',
    values: [
      {time: 1370044801, y: 1000 },
      {time: 1370044901, y: 4000 }
    ]
  }];

  var data_bits = [{
    layer: 'Layer 1',
    values: [{time: Date.now()/1000, y: 0}, {time: Date.now()/1000, y: 1000}]
  }];

  var chart = $('#myChart').epoch({
    type: 'time.line',
    data: data_bits,
    axes: ['bottom', 'right', 'left']
  });

  setInterval(function() {
    $.getJSON(window.location.origin + '/users/'+ $("#userInfo").val() +'/current_reading', function(responseData) {

      var newDataBit = [{
        time: (Date.now()/1000),
        y: responseData.data_point
      }];
      console.log(newDataBit);
      console.log(data_bits);

      chart.push(newDataBit);

    });
  }, 1000);
});
