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

//= require jquery.raty.js


  function OnButtonClick() {
    const St_name = document.getElementById("St_name");
    const station = document.getElementById("station_name").value;

    var url = 'https://express.heartrails.com/api/json?method=getStations&name='+ station;

    fetch(url)
  .then(response => {
    return response.json();
  })

  .then(data => {
    const Data = JSON.parse(JSON.stringify(data))

    const data1 = Data.response.station
    console.log(data1)
    St_name.innerHTML = "OK"
    $("#station_name").val(data1[0].name);


  })

  .catch(data => {
    console.log("NOT")
     $("#station_name").val("");
    St_name.innerHTML = "駅名が見つかりません"
  })
};

var num = 0;

function changeImage_plus() {
  const img_id = document.getElementById("img_id");

  var img = new Array()
  img = $("#img_name").val();
  img = JSON.parse(img)

  if (num == img.length-1){
    num = 0;
  }

  else {
    num ++;
  }

  console.log(img[num])
   $("#img_id").attr('src', img[num]);
};

function changeImage_negative() {
  const img_id = document.getElementById("img_id");

  var img = new Array()
  img = $("#img_name").val();
  img = JSON.parse(img)

  if (num == img.length-1){
    num = 0;
  }

  else {
    num --;
  }

  console.log(img[num])
   $("#img_id").attr('src', img[num]);
};




