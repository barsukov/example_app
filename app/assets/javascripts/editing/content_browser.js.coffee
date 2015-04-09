scrivito.on 'load', ->
  # Configure content browser to show an image filter
  scrivito.content_browser.filters =
    _obj_class:
      field: '_obj_class'
      options:
        Image:
          icon: 'image'
        Download:
          icon: 'generic'
