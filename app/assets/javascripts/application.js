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
//= require bootstrap-sprockets
//= require turbolinks
//= require spin
//= require ladda
//= require jquery-fileupload/basic
//= require_tree .

var showNotification = function(data){
  var type = data.type,
    message = data.message,
    $flash_notice = $('#flash_notice');

  if(type && message){
    var html = '<div class="container"><div class="alert alert-{type} alert-dismissible" role="alert"><button class="close" data-dismiss="alert">x</button>{message}</div></div>'
          .replace(/{type}/g, type)
          .replace(/{message}/g, message);

    $flash_notice.html(html);
  } else {
    $flash_notice.html("");
  }
}