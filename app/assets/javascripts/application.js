// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .



('button').click(function() {
        console.log('クリックされました！');
    })



  ('button').click(function() {
    const canvas = document.getElementById("canvas");
    const no_data = document.getElementById("no_data");
    const station = document.getElementById("station").value;

    var url = 'https://express.heartrails.com/api/json?method=getStations&name='+ station;

    fetch(url)
  .then(response => {
    return response.json();
  })

  .then(data => {
    const Data = JSON.parse(JSON.stringify(data))

    const data1 = Data.response.station
    console.log(data1)
    canvas.innerHTML = data1[1].name
    no_data.innerHTML = ""

    $.ajax({
      url: 'homes/index',
      type: 'GET',
      datatype: 'html',
      async: true,
      data: {
        station: data[1].name
      },
    });

  })

  .catch(data => {
    console.log("NOT")
    canvas.innerHTML = ""
    no_data.innerHTML = "駅名が見つかりません"
  })


});