(($) ->
  $ ->
    $('button[data-behavior="generate_csv"]').click -> 
      $('button[data-behavior="generate_csv"]').hide()
      $('div[data-behavior="generating_csv"]').show()

    $('form[data-attribute="generate_csv_form"]').on 'ajax:success', (e, data, xhr) ->
      $('input:checkbox').removeAttr('checked')

      url = data.url
      
      poll = (url) ->
        $.ajax({
          type: "GET",
          dataType: 'json',
          url:  url,
          error: ->
            setTimeout ( => poll(url) ), 5000
          success: (data, status, xhr) ->
            $('div[data-behavior="generating_csv"]').hide()
            $('a[data-attribute="download_csv_link"]').attr("href", data.file)
            $('div[data-behavior="download_csv"]').show()
        })

      poll(url)
) jQuery