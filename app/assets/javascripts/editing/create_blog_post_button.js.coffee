jQuery ->
  # When in-place editing is active and the editor is in an editable working
  # copy, a button is inserted to be able to create a new blog post.
  scrivito.on 'load', ->
    if scrivito.in_editable_view()
      # Create a new DOM element for the button, that allows editors to create a
      # new blog post in place.
      button = $('<button />')
        .text('New blog post')
        .css('margin-bottom', '20px')
        .addClass('btn btn-warning')

      # Place the button on top of all blog posts on the blog overview page.
      button.prependTo $('.blog_posts')

      # Define what happens when the editor clicks the inserted button. All
      # required blog post attributes are gathered and a new blog post object is
      # created in the CMS. The current date and user are prefilled. When
      # it is created successfully, the editor is redirected to its details page.
      button.on 'click', ->
        $(this).attr('disabled', true)

        prefixPath = $('#blog').attr('data-path')
        now = new Date()
        path = now.toISOString().replace(/[^0-9]/g, '')

        scrivito
          .create_obj(
            _obj_class: 'BlogPost'
            _path: "#{prefixPath}/#{path}"
            published_at: now
          ).done (data) ->
            window.location.href = "/#{data.id}"

