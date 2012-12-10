//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require ckeditor/init
//= require jquery.ui.sortable
//= require jquery.ui.datepicker
//= require jquery.ui.datepicker-ru
//= require sortable
//= require cocoon

(function($) { $(function() {

  $('form').on('focusin', 'input.datepicker', function() {

    $(this).datepicker({});
  });

  $('.tab-pane').each(function() {

    var id = $(this).attr('id'), link;
    $(this).find('.error:first').each(function() {

      link = $('a[href="#'+id+'"]');
      if (! $('a.alert-error').length)
        link.click();
      link.addClass('alert-error');
    });
  });

})})(jQuery);
