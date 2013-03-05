//= require ckeditor/init
//= require cocoon

$(function() {
    $('a.refresh-timepad-maillists').click( function() {
      var select = $('#maillists'), i, icon = $(this).children();
      icon.removeAttr('class').addClass('icon-refresh animate-rotation');
      $.post($(this).attr('href'), '_method=put', function(data) {

        select.find('option + option').remove();
        for (i in data.items) 
          select.append('<option value=' + data.items[i].original_id + '>' + data.items[i].name +  '</option>');
        icon.removeAttr('class').addClass('icon-refresh');
      }, 'json').error( function() {
        icon.removeAttr('class').addClass('icon-warning-sign');
      });

      return false;
    });
});
