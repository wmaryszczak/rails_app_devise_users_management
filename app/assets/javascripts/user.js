
$(document).ready(function() {
  users.init();
});


var pageDefaults = {
  'ajaxResetPasswordUrl':  function(id) {
    var url = "users/reset_password/_dummy";
    return url.replace('_dummy', id);
  }
}

var users = {
  init: function() {
    var $resetPasswdBtn = $(".reset_passwd");
    $resetPasswdBtn.on("click", function(e) {      
      e.preventDefault();
      var s = this;
      var $self = $(s),
        id = $self.data('id');
      var l = Ladda.create(this);
      l.start();        

      $.ajax({
        url: pageDefaults.ajaxResetPasswordUrl(id),
        contentType: "application/json",
        type: 'POST',
      }).done(function(data, status, xhr) {
          showNotification(data);
        }).always(function(){
          l.stop();
        });      
    });

  }
} 
