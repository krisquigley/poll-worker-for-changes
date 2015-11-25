( ($) ->

  $ ->
    $('#select_all').on "click", (event) ->
      $('input[type=checkbox]').prop('checked', $(this).prop('checked'))

)(jQuery)