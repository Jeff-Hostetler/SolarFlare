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

/*real time sensor data graph, current_reading*/
$(function() {
  $('a[href*=#]:not([href=#])').on('click', function() {
    console.log('clicked');
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});

$(function(){

  var start_data = [{
    layer: 'Layer 1',
    values: [{time: Date.now()/1000, y: 0}, {time: Date.now()/1000, y: 1000}]
  }];

  var chart = $('#realTimeChart').epoch({
    type: 'time.line',
    data: start_data,
    axes: ['bottom', 'right', 'left']
  });

  setInterval(function() {
    $.getJSON(window.location.origin + '/users/'+ $("#userInfo").val() +'/current_reading', function(responseData) {
      /*push new data into chart with ajax call */
      var newData = [{
        time: (Date.now()/1000),
        y: responseData.data_point
      }];
      chart.push(newData);
      /*adjust color of background based on the light level reading*/
      if (responseData.data_point < 400){
        $('#realTimeChart').addClass('dark');
        $('#realTimeChart').removeClass('bright');
        $('.realTimeChartMessage').fadeTo('slow', 100);
      }
      else{
        $('#realTimeChart').addClass('bright');
        $('#realTimeChart').removeClass('dark');
        $('.realTimeChartMessage').fadeTo('slow', 0);
      }
    });
  }, 1000);
});
