//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.ui.all
//= require sortable
//= require bootstrap
//= require jscolor
//= require js-routes

(function($) { $(function() {

  $('form').on('focusin', 'input.datepicker', function() {

    var
      min_year = $(this).attr('data-year-min'),
      max_year = $(this).attr('data-year-max'),
      min_date = min_year ? new Date(min_year, 0, 1) : null,
      max_date = max_year ? new Date(max_year, 11, 31) : null
      year_range = (min_year && max_year) ? min_year + ':' + max_year : null
    ;

    options = {
      defaultDate: max_date,
      minDate: min_date,
      maxDate: max_date,
      changeMonth: !!year_range,
      changeYear: !!year_range,
      yearRange: year_range
    }

    $(this).closest('form').off('focusin', 'input.datepicker');
    $(this).datepicker(options);
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
