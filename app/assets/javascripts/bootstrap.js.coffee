jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $("p[rel=popover]").popover()

  $('input#user_university').autocomplete
    source: Routes.api_universities_path()
    minLength: 2

