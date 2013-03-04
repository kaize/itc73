//= require ckeditor/init
//= require cocoon
//= require bootstrap
$(function() {
    $('a.refresh-timepad-maillists').click( function() {

      var select = $(this).parent().find('select'), i, icon = $(this).children();
      icon.removeAttr('class').addClass('icon-refresh animate-rotation');
      $.post($(this).attr('href'), '_method=put', function(data) {

        select.find('option + option').remove();
        for (i in data.items)
          select.append('<option value=' + data.items[i].id + '>' + data.items[i].name 
                        + ' (' + data.items[i].items_count + ')' + '</option>');

        icon.removeAttr('class').addClass('icon-refresh');
      }, 'json').error( function() {

        icon.removeAttr('class').addClass('icon-warning-sign');
      });

      return false;
    });
});
