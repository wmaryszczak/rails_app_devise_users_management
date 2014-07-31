$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        done: function (e, data) {
          console.log(data);
        }
    });
});