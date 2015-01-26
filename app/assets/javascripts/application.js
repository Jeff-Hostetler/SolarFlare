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
    // $.getJSON(window.location.origin + '/users/'+ $("#userInfo").val() +'/current_reading', function(responseData) {
      /*push new data into chart with ajax call */
      var keen_project_id = "54c027842fd4b1301e805448";
      var keen_read_key = "ba321912884893a7ac35a5b6123879ae17f76acf81a2e7144e412bbd79225bed5f36f150823712a79d6392dd7a6bf1cfd054d6955ccb1ee689fa789df11b232337cd3419c9d202dbe1fe10f8bcfb6d95685f8cd2598b84cb0ad306232802fd20b8ae8ebd3569371d1ad96a9a41f7be9a";

      $.getJSON("https://api.keen.io/3.0/projects/"+ "54c027842fd4b1301e805448" +"/queries/extraction?api_key="+ "ba321912884893a7ac35a5b6123879ae17f76acf81a2e7144e412bbd79225bed5f36f150823712a79d6392dd7a6bf1cfd054d6955ccb1ee689fa789df11b232337cd3419c9d202dbe1fe10f8bcfb6d95685f8cd2598b84cb0ad306232802fd20b8ae8ebd3569371d1ad96a9a41f7be9a" +"&event_collection=sensors&latest=1", function(responseData) {

      var newData = [{
        time: (Date.now()/1000),
        y: responseData.result[0].data_point
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
